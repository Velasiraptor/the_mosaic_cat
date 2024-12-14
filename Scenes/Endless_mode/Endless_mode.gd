extends Node2D

var start_game_lvl = Global.level_4x4

func _ready():
	var start_lvl = start_game_lvl.instantiate()
	add_child(start_lvl)

func _on_button_exit_pressed():
	get_tree().change_scene_to_file("res://Scenes/UI/MainMenu/main_menu.tscn")

func _on_button_setting_pressed():
	pass # Replace with function body.


func _on_mm_button_pressed(): # Выход в главное меню
	pass # Replace with function body.
