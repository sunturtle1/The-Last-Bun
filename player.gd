extends CharacterBody2D
@export var speed: float = 500.0
@onready var item_label = $".."/Control/CanvasLayer/RichTextLabel
@onready var anim = $AnimatedSprite2D
@onready var oven = $".."/oven
@onready var counter = $".."/Counter
@onready var trashcan = $".."/Trashcan
@export var CurrentPlayerItem = ""

func _ready() -> void:
	update_item_display()

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
	if Input.is_action_just_pressed("interact"):
		if oven.is_player_near_oven and CurrentPlayerItem == "Raw Patty":
			oven.place_patty()
			play_place_animation()
			CurrentPlayerItem = ""
			update_item_display()
		elif oven.is_player_near_oven and CurrentPlayerItem == "":
			oven.take_patty()
			play_place_animation()
			update_item_display()
		elif counter.is_player_in_range and CurrentPlayerItem != "":
			counter.place_item(CurrentPlayerItem)
			play_place_animation()
			update_item_display()
		elif counter.is_player_in_range and CurrentPlayerItem == "":
			counter.take_item()
			play_place_animation()
			update_item_display()
		elif trashcan.is_player_in_range:
			trashcan.trash_item()
			play_place_animation()
			update_item_display()
	move_direction = move_direction.normalized()
	velocity = move_direction * speed
	move_and_slide()
	
	if move_direction != Vector2.ZERO:
		anim.play("default")
		anim.flip_h = move_direction.x < 0
	else:
		anim.play("idle")
		
func play_place_animation():
	# Play placing animation
	anim.play("placing")  # Make sure you have this animation
	# If you don't have a "place" animation, use a different one
	# anim.play("interact")
	
	# Optional: Add a small delay before returning to idle
	await get_tree().create_timer(0.5).timeout
	if velocity == Vector2.ZERO:
		anim.play("idle")

		
func update_item_display():
	if CurrentPlayerItem == "":
		item_label.text = "[bgcolor=black][color=white]  Hand: Empty  [/color][/bgcolor]"
	else:
		item_label.text = "[bgcolor=black][color=white]  Hand: %s  [/color][/bgcolor]" % CurrentPlayerItem
