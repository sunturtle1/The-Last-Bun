extends StaticBody2D
@onready var interaction_area = $Area2D
@onready var player = $".."/player
@onready var item_root = $ItemRoot
@onready var item_sprite = $ItemRoot/ItemSprite
@export var current_item = ""
var is_player_in_range = false
var item_textures = {
	"Raw Patty": preload("res://images/nyershusi.png"),
	"Cooked Patty": preload("res://images/husi.png"),
	"Tomato": preload("res://images/paradise.png"),
	"Onion": preload("res://images/hagyma.png"),
	"Salad": preload("res://images/salata.png"),
	"Bottom Bun": preload("res://images/bucialja.png"),
	"Top Bun": preload("res://images/buciteto.png"),
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	item_sprite.texture = null
	var players = get_tree().get_nodes_in_group("player")
	if players.size() > 0:
		player = players[0]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		is_player_in_range = true
		player = body


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		is_player_in_range = false
		
func place_item(item_name):
	if current_item == "" and is_player_in_range:
		current_item = item_name
		player.CurrentPlayerItem = ""
		item_sprite.texture = item_textures[current_item]
		
func take_item():
	if current_item != "" and is_player_in_range:
		player.CurrentPlayerItem = current_item
		current_item = ""
		item_sprite.texture = null
