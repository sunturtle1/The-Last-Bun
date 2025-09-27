extends StaticBody2D
@onready var patty = $".."/patty
@onready var timer = $Timer
@onready var player = $".."/player
var pattyscene = preload("res://patty.tscn")
var IsPattyOnOven = false
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		place_patty()
	pass

func place_patty():
	if IsPattyOnOven == false:
		var patty = pattyscene.instantiate()
		add_child(patty)
		patty.position = Vector2(0, 0)
		timer.start()
		IsPattyOnOven = true
	else: 
		print("there is an another patty on the grill")

func _on_timer_timeout() -> void:
	print("kesz a hus")
	
func take_patty():
	if IsPattyOnOven == true and player.CurrentItem == "":
		patty.queue_free()
