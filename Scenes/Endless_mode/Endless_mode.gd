extends Node2D

@onready var audio_button = %Audio_button
@onready var setting_menu = %Setting_menu

@onready var menu_yes_no = %Menu_Yes_No


var start_game_lvl = Global.level_4x4
		

func _ready():
	var start_lvl = start_game_lvl.instantiate()
	add_child(start_lvl)

func _on_button_exit_pressed():
	audio_button.play()
	get_tree().paused = true
	menu_yes_no.visible = true
	menu_yes_no.anim_play()
	menu_yes_no.visible_back()

func _on_button_setting_pressed(): #Настройки
	get_tree().paused = true
	audio_button.play()
	get_tree().call_group("Setting_menu", "animation_setting_scale")
