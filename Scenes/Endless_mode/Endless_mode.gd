extends Node2D

@onready var audio_button = %Audio_button


var start_game_lvl = Global.level_4x4

func _ready():
	var start_lvl = start_game_lvl.instantiate()
	add_child(start_lvl)

func _on_button_exit_pressed():
	audio_button.play()
	await get_tree().create_timer(0.2).timeout #Для звука
	get_tree().change_scene_to_file("res://Scenes/UI/MainMenu/main_menu.tscn")

func _on_button_setting_pressed():
	audio_button.play()
	pass # Replace with function body.
