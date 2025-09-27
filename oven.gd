extends StaticBody2D
@onready var timer = $Timer
var pattyscene = preload("res://patty.tscn")

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		place_patty()
	pass

func place_patty():
	var patty = pattyscene.instantiate()
	add_child(patty)
	patty.position = Vector2(0, 0)
	timer.start()

func _on_timer_timeout() -> void:
	print("kesz a hus")
	
	
