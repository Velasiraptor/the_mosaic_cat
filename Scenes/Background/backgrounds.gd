extends CanvasLayer

@onready var texture_back = %Texture_back

func _ready():
	random_background()

func random_background():
	var next_texture_back = Global.all_backgrounds
	next_texture_back = next_texture_back.pick_random()
	while next_texture_back == Global.last_background:
		next_texture_back = Global.all_backgrounds
		next_texture_back = next_texture_back.pick_random()
	texture_back.texture = next_texture_back
	Global.last_background = next_texture_back
