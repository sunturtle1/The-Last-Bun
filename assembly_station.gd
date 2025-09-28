extends StaticBody2D
@onready var itemroot = $itemroot
@onready var itemsprite = $itemroot/itemsprite
@onready var player = $".."/player
@onready var interactionarea = $InteractionArea
var is_player_in_range = false
var current_items = []
var item_textures = {
	"Raw Patty": preload("res://images/nyershusifixed.png"),
	"Cooked Patty": preload("res://images/husifixed.png"),
	"Tomato": preload("res://images/paradise.png"),
	"Onion": preload("res://images/hagyma.png"),
	"Lettuce": preload("res://images/salata.png"),
	"Bottom Bun": preload("res://images/bucialja.png"),
	"Top Bun": preload("res://images/buciteto.png"),
	"Complete Burger": preload("res://images/keszbuci.png")
}

func _ready() -> void:
	itemsprite.texture = null

func _on_interaction_area_body_entered(body: Node2D) -> void:
	if body.name == "player":
		is_player_in_range = true
	


func _on_interaction_area_body_exited(body: Node2D) -> void:
	if body.name == "player":
		is_player_in_range = false


func place_item(item):
	if current_items.size() < 6 and is_player_in_range:
			current_items.append(item)
			print("you put ", item, " on the assembler")
			player.CurrentPlayerItem = ""
			player.update_item_display()
			print(current_items)
			itemsprite.texture = item_textures[item]
			
			
func take_item():
	if current_items.size() > 0 and is_player_in_range and player.CurrentPlayerItem == "":
		if "Complete Burger" in current_items:
			player.CurrentPlayerItem = "Complete Burger"
			current_items.erase("Complete Burger")
			player.update_item_display()
			print("You took the complete burger")
			itemsprite.texture = null
		else:
			player.CurrentPlayerItem = current_items.pop_back()
			player.update_item_display()
			itemsprite.texture = null
			print("you took", player.CurrentPlayerItem, " from assembler")
	
func try_assemble_burger():
	var has_bottom_bun = false
	var has_cooked_patty = false
	var has_lettuce = false
	var has_onion =  false
	var has_tomato = false
	var has_top_bun = false
	for item in current_items:
		if item == "Bottom Bun":
			has_bottom_bun = true
		elif item == "Cooked Patty":
			has_cooked_patty = true
		elif item == "Lettuce":
			has_lettuce = true
		elif item == "Onion":
			has_onion = true
		elif item == "Tomato":
			has_tomato = true
		elif item == "Top Bun":
			has_top_bun = true
			
	if has_bottom_bun and has_cooked_patty and has_lettuce and has_onion and has_tomato and has_top_bun:
		current_items.erase("Bottom Bun")
		current_items.erase("Cooked Patty")
		current_items.erase("Lettuce")
		current_items.erase("Onion")
		current_items.erase("Tomato")
		current_items.erase("Top Bun")
		
		current_items.append("Complete Burger")
		itemsprite.texture = preload("res://images/keszbuci.png")
		print("You Completed THE BURGER")
		
		
		

	
	
