extends Node2D
@onready var meghaltal = $Control/Meghaltal

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	meghaltal.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
