extends Control

@onready var texture_back = %Texture_back
@onready var audio_button = %Audio_button

@onready var menu_yes_no = %Menu_Yes_No


# Максимальное смещение в пикселях
const MAX_OFFSET = 20

# Базовая позиция текстуры
var base_position: Vector2
var calibration_offset: Vector3 = Vector3()


func _ready():
	get_tree().paused = false
	# Сохраняем изначальную позицию текстуры
	base_position = texture_back.position
	calibration_offset = Input.get_accelerometer()

func _process(delta):
	# Получаем данные акселерометра
	var accel = Input.get_accelerometer()
	
	# Вычитаем калибровочное смещение
	var calibrated_accel = accel - calibration_offset
	
	# Рассчитываем смещение по X и Y
	var offset_x = clamp(calibrated_accel.x * MAX_OFFSET, -MAX_OFFSET, MAX_OFFSET)
	var offset_y = clamp(-calibrated_accel.y * MAX_OFFSET, -MAX_OFFSET, MAX_OFFSET)
	
	# Применяем смещение к базовой позиции
	texture_back.position = texture_back.position.lerp(base_position + Vector2(offset_x, offset_y), 0.1)



func _on_play_button_pressed():
	audio_button.play()
	await get_tree().create_timer(0.2).timeout #Для звука
	get_tree().change_scene_to_file("res://Scenes/Endless_mode/Endless_mode.tscn")


func _on_button_exit_pressed(): #Выход
	audio_button.play()
	menu_yes_no.visible = true
	menu_yes_no.anim_play()
	menu_yes_no.visible_back()


func _on_button_setting_pressed(): #Настройки
	audio_button.play()
	get_tree().call_group("Setting_menu", "animation_setting_scale")


func _on_shop_button_pressed(): #Магазин
	audio_button.play()
	pass # Replace with function body.


func _on_collection_button_pressed(): #Коллекция
	audio_button.play()
	pass # Replace with function body.
