extends Node

var check_rotate_cat := false
var last_lvl = load("res://Scenes/levels/level_4x4/level_4x4_tile.tscn")

var level_4x4 = load("res://Scenes/levels/level_4x4/level_4x4_tile.tscn")
var level_6x6 = load("res://Scenes/levels/level_6x6/level_6x6_tile.tscn")
var level_blob = load("res://Scenes/levels/level_blob/level_blob.tscn")
var level_circle = load("res://Scenes/levels/level_circle/level_circle.tscn")
var level_cross = load("res://Scenes/levels/level_cross/level_cross.tscn")
var level_rocket = load("res://Scenes/levels/level_rocket/level_rocket.tscn")
var level_ring = load("res://Scenes/levels/level_ring/level_ring.tscn")
var level_butterfly = load("res://Scenes/levels/level_butterfly/level_butterfly.tscn")
var level_lethal_company = load("res://Scenes/levels/level_lethal_company/level_lethal_company.tscn")

var all_levels = [
	#Маленькие уровни
	level_4x4,
	#Средние уровни
	level_6x6,
	level_butterfly,
	level_lethal_company,
	#Большие уровни
	level_blob,
	level_circle,
	level_cross,
	level_rocket,
	level_ring
]
