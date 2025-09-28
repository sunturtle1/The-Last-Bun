extends StaticBody2D
@onready var player = $".."/player
@onready var interaction_area = $Area2D
var is_player_in_range = false

func trash_item():
	if is_player_in_range and  player.CurrentPlayerItem != "":
		player.CurrentPlayerItem = ""

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		is_player_in_range = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "player":
		is_player_in_range = true
