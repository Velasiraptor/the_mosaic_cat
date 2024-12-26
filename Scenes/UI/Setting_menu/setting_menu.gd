extends CanvasLayer

@onready var audio_button = %Audio_button
@onready var audio_music = %Audio_music
@onready var audio_sound = %Audio_sound


@onready var animation_scale = %Animation_scale

@onready var volume_music = %Volume_music
@onready var volume_sounds = %Volume_sounds


func _ready():
	visible = false
	
	audio_music.volume_db = -100
	audio_sound.volume_db = -100
	
	
	volume_music.value = SaveFile.Music_volume
	if volume_music.value == 0:
		AudioServer.set_bus_volume_db(1, -100)
	else:
		AudioServer.set_bus_volume_db(1, SaveFile.Music_volume * 1.5)
	
	volume_sounds.value = SaveFile.Sound_volume
	if volume_sounds.value == 0:
		AudioServer.set_bus_volume_db(2, -100)
	else:
		AudioServer.set_bus_volume_db(2, SaveFile.Sound_volume * 1.5)
	
	await get_tree().create_timer(0.5).timeout
	audio_music.volume_db = 0
	audio_sound.volume_db = 0

func _on_back_button_pressed():
	audio_button.play()
	SaveFile.save_game()
	visible = false
	get_parent().get_tree().paused = false

func animation_setting_scale():
	visible = true
	animation_scale.play("Scale")


func _on_volume_music_value_changed(value): #МУЗЫКА
	AudioServer.set_bus_volume_db(1, value*1.5)
	if value == 0:
		AudioServer.set_bus_volume_db(1, -100)
	SaveFile.Music_volume = volume_music.value
	
	
	audio_music.play()


func _on_volume_sounds_value_changed(value): #Звуковые эффекты
	AudioServer.set_bus_volume_db(2, value*1.2)
	if value == 0:
		AudioServer.set_bus_volume_db(2, -100)
	SaveFile.Sound_volume = volume_sounds.value
	
	audio_sound.play()
