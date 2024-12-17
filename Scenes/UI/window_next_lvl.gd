extends CanvasLayer

@onready var animation_next_lvl = %Animation_next_lvl
@onready var animation_light = %Animation_light
@onready var animation_light_rotation = %Animation_light_rotation

@onready var rating = %Rating

@onready var audio_button = %Audio_button


var rating_A_texture = load("res://Sprites/UI/Rating/Rating_A.png")
var rating_B_texture = load("res://Sprites/UI/Rating/Rating_B.png")
var rating_C_texture = load("res://Sprites/UI/Rating/Rating_C.png")

func _ready():
	visible = false
	

func animation_window():
	get_tree().call_group("timer_victory", "timer_victory_stop")
	animation_next_lvl.play("Scale")
	animation_light.play("light_move")
	animation_light_rotation.play("rotation")


func _on_mm_button_pressed(): #Выход в главное меню
	audio_button.play()
	await get_tree().create_timer(0.2).timeout #Для звука
	get_tree().change_scene_to_file("res://Scenes/UI/MainMenu/main_menu.tscn")

func _on_next_lvl_button_pressed():
	audio_button.play()
	await get_tree().create_timer(0.2).timeout #Для звука
	
	var next_lvl = Global.all_levels
	next_lvl = next_lvl.pick_random()
	while next_lvl == Global.last_lvl:
		next_lvl = Global.all_levels
		next_lvl = next_lvl.pick_random()
	Global.last_lvl = next_lvl
	get_parent().get_parent().add_child(next_lvl.instantiate())
	get_parent().queue_free()

func rating_B():
	if visible == false:
		rating.texture = rating_B_texture
		get_tree().call_group("timer_victory", "timer_yellow")

func rating_C():
	if visible == false:
		rating.texture = rating_C_texture
		get_tree().call_group("timer_victory", "timer_red")
