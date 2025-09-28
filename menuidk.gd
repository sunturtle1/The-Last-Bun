extends Node2D
@onready var player = $".."/player

func _on_paradise_button_pressed() -> void:
	print("Paradicsom pickuped")
	if player.CurrentPlayerItem == "":
		player.CurrentPlayerItem = "Tomato"
		player.update_item_display()
	


func _on_salad_button_pressed() -> void:
	print("Salad felvéve")
	if player.CurrentPlayerItem == "":
		player.CurrentPlayerItem = "Salad"
		player.update_item_display()

func _on_onion_button_pressed() -> void:
	if player.CurrentPlayerItem == "":
		player.CurrentPlayerItem = "Onion"
		player.update_item_display()


func _on_husi_button_pressed() -> void:
	if player.CurrentPlayerItem == "":
		player.CurrentPlayerItem = "Raw Patty"
		player.update_item_display()


func _on_bucialjabutton_pressed() -> void:
	if player.CurrentPlayerItem == "":
		player.CurrentPlayerItem = "Bottom Bun"
		player.update_item_display()
func _on_bucitetejebutton_pressed() -> void:
	if player.CurrentPlayerItem == "":
		player.CurrentPlayerItem = "Top Bun"
		player.update_item_display()
