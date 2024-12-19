extends CanvasLayer

@onready var audio_button = %Audio_button
@onready var animation_scale = %Animation_scale


func _ready():
	visible = false

func _on_back_button_pressed():
	audio_button.play()
	visible = false
	get_parent().get_tree().paused = false

func animation_setting_scale():
	visible = true
	animation_scale.play("Scale")
