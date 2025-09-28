extends StaticBody2D

@onready var timer = $Timer
@onready var player = $".."/player
@onready var spawn_point = $PattySpawnPoint
var patty_scene = preload("res://patty.tscn")
var current_patty: Node2D = null
var is_patty_on_oven = false
var is_patty_cooked = false   
var is_player_near_oven = false
# load textures
var raw_texture = preload("res://images/nyershusifixed.png")
var cooked_texture = preload("res://images/husifixed.png")



func _input(event: InputEvent) -> void:
	pass
func place_patty():
	if not is_patty_on_oven and is_player_near_oven:
		current_patty = patty_scene.instantiate()
		add_child(current_patty)
		current_patty.global_position = spawn_point.global_position

		# set to raw
		var sprite = current_patty.get_node("Sprite2D")
		sprite.texture = raw_texture

		timer.start()
		is_patty_on_oven = true
		is_patty_cooked = false
	else: 
		print("there is already another patty on the grill")

func _on_timer_timeout() -> void:
	if current_patty:
		var sprite = current_patty.get_node("Sprite2D")
		sprite.texture = cooked_texture
		is_patty_cooked = true
		print("Patty is now cooked!")

func take_patty():
	if is_patty_on_oven and current_patty and player.CurrentPlayerItem == "":
		if is_patty_cooked:
			player.CurrentPlayerItem = "Cooked Patty"
		else:
			player.CurrentPlayerItem = "Raw Patty"

		player.update_item_display()
		current_patty.queue_free()
		current_patty = null
		is_patty_on_oven = false
		is_patty_cooked = false


func _on_interaction_area_body_entered(body: Node2D) -> void:
	if body.name == "player":
		is_player_near_oven = true
		

func _on_interaction_area_body_exited(body: Node2D) -> void:
	if body.name == "player":
		is_player_near_oven = false
