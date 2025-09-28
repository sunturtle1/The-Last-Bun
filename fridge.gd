extends Node2D

@export var closedfridge = preload("res://images/hutofixedclosed.png")
@export var openedfridge = preload("res://images/hutofixed.png")
@export var menu = preload("res://menuidk.tscn")

var new_scene_instance : Node = null

func _ready():
	pass




func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("player") and new_scene_instance:
		new_scene_instance.queue_free()
		new_scene_instance = null


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		print("You opened the fridge.")
		new_scene_instance = load("res://menuidk.tscn").instantiate()
		get_tree().current_scene.add_child(new_scene_instance)
