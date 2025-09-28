extends CharacterBody2D
@onready var player = $".."/player
@onready var timer = $Timer
@onready var calm = $Sprite2D
@onready var angry = $Sprite2D2
@onready var audio_player: AudioStreamPlayer2D = $deathsound
@onready var nyamnyam = $nyamnyam
@onready var meghaltal = $".."/Control/Meghaltal
var is_player_in_range = false
func _ready():
	calm.visible = true
	angry.visible = false

func _process(delta: float) -> void:
	# Update time_remaining every frame
	var time_remaining = timer.time_left
	print(time_remaining)
	
	# Only check if timer is running and has time left
	if timer.is_stopped():
		calm.visible = true
		angry.visible = false
	elif time_remaining <= 10 and time_remaining > 0:
		calm.visible = false
		angry.visible = true
	else:
		calm.visible = true
		angry.visible = false


func _on_timer_timeout() -> void:
	audio_player.play()
	meghaltal.visible = true
	
	
func take_burger():
	if is_player_in_range and player.CurrentPlayerItem == "Complete Burger":
		player.CurrentPlayerItem = ""
		player.update_item_display()
		timer.start()
		nyamnyam.play()
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		is_player_in_range = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "player":
		is_player_in_range = false
