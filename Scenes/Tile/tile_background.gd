extends TextureRect

@onready var collision_tile = %Collision_tile

var body_name = ""

func _ready():
	collision_tile.debug_color = "96331f6b"
	modulate = "ffffff"
	



func _on_area_tile_body_entered(body): # Состояние, когда коты в тайле
	if body_name == "":
		body_name = body.name
		modulate = "bababa"
		collision_tile.debug_color = "066c156b"
		body.cat_completed_minus()


func _on_area_tile_body_exited(body): # Состояние, когда коты не в тайле
	if body.name == body_name:
		modulate = "ffffff"
		collision_tile.debug_color = "96331f6b"
		body.cat_completed_plus()
		body_name = ""
