extends StaticBody2D
@onready var item_sprite = $Sprite2D
@onready var interaction_area = $Area2D
@onready var player = $".."/player
@export var current_item = ""
var is_player_in_range = false
var item_textures = {
	"Raw Patty": preload("res://images/nyershusi.png"),
	"Cooked Patty": preload("res://images/husi.png"),
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		is_player_in_range = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "player":
		is_player_in_range = false
		
func place_item(item_name):
	if current_item == "" and is_player_in_range:
		current_item = item_name
		player.CurrentPlayerItem = ""
