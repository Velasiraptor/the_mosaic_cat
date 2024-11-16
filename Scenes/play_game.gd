extends Node2D

var start_game_lvl = Global.level_4x4

func _ready():
	var start_lvl = start_game_lvl.instantiate()
	add_child(start_lvl)
