extends CharacterBody2D
@export var speed: float = 500.0
@onready var item_label = $".."/CanvasLayer/CurrentItemLabel
@onready var anim = $AnimatedSprite2D
@onready var oven = $".."/oven
@export var CurrentItem = ""

func _process(delta: float) -> void:
	var move_direction := Vector2.ZERO
	if Input.is_action_pressed("up"):
		move_direction.y = -1
	if Input.is_action_pressed("down"):
		move_direction.y = 1
	if Input.is_action_pressed("left"):
		move_direction.x = -1
	if Input.is_action_pressed("right"):
		move_direction.x = 1
		
	move_direction = move_direction.normalized()
	velocity = move_direction * speed
	move_and_slide()
	
	if move_direction != Vector2.ZERO:
		anim.play("default")
		anim.flip_h = move_direction.x < 0
	else:
		anim.play("idle")
		
	if Input.is_action_just_pressed("take_patty"):
		oven.take_patty()

		
func update_item_display():
	if CurrentItem == "":
		item_label.text = "Hand: Empty"
	else:
		item_label.text = "Hand: %s" % CurrentItem
