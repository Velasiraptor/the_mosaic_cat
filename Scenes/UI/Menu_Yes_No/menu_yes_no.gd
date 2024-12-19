extends CanvasLayer

@export var text_menu_exit := false 


@onready var audio_button = %Audio_button
@onready var animation_scale = %Animation_scale

@onready var text_center = %Text_center

@onready var color_blur = %Color_Blur



func _ready():
	color_blur.visible = false
	visible = false
	if text_menu_exit == false:
		text_center.text = "Выйти в главное 
меню?"
	else:
		text_center.text = "Выйти из игры?"



func anim_play():
	animation_scale.play("Scale")


func _on_no_button_pressed(): #НЕТ
	audio_button.play()
	visible = false
	get_parent().get_tree().paused = false


func _on_yes_button_pressed(): #ДА
	if text_menu_exit == false:
		audio_button.play()
		await get_tree().create_timer(0.2).timeout #Для звука
		get_tree().change_scene_to_file("res://Scenes/UI/MainMenu/main_menu.tscn")
	else:
		audio_button.play()
		await get_tree().create_timer(0.2).timeout #Для звука
		get_tree().quit()

func visible_back():
	color_blur.visible = true
