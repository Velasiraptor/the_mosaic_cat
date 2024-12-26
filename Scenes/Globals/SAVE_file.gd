extends Node


var Sound_volume := 7
var Music_volume := 5

const SAVE_GAME_FILE := "user://MOSAICAT.save"
const SAVE_VARIABLES := ["Sound_volume", "Music_volume"]


func _ready():
	load_game()
	

func save_game():
	var save_game_file = FileAccess.open(SAVE_GAME_FILE, FileAccess.WRITE)
	if save_game_file == null:
		printerr("сохарнение провалилось с ошибкой {0}".format([FileAccess.get_open_error()]))
		return
	var game_data := {}
	for varible in SAVE_VARIABLES:
		game_data[varible] = get(varible)
	var json_object := JSON.new()
	save_game_file.store_line(json_object.stringify(game_data))

func load_game():
	if not FileAccess.file_exists(SAVE_GAME_FILE):
		return
	var save_game_file = FileAccess.open(SAVE_GAME_FILE, FileAccess.READ)
	if save_game_file == null:
		printerr("сохарнение провалилось с ошибкой {0}".format([FileAccess.get_open_error()]))
		return
	var json_object = JSON.new()
	var error = json_object.parse(save_game_file.get_line())
	if error != OK:
		return
	var game_data = json_object.get_data()
	for varible in SAVE_VARIABLES:
		if varible in game_data:
			set(varible, game_data[varible])
