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
var level_ghost = load("res://Scenes/levels/level_ghost/level_ghost.tscn")
var level_axolotl = load("res://Scenes/levels/level_axolotl/level_axolotl.tscn")
var level_puzzle = load("res://Scenes/levels/level_puzzle/level_puzzle.tscn")
var level_heart = load("res://Scenes/levels/level_heart/level_heart.tscn")
var level_paw = load("res://Scenes/levels/level_paw/level_paw.tscn")

var all_levels = [
	#Маленькие уровни
	level_4x4,
	#Средние уровни
	level_6x6,
	level_butterfly,
	level_lethal_company,
	level_ghost,
	level_axolotl,
	level_puzzle,
	#Большие уровни
	level_blob,
	level_circle,
	level_cross,
	level_rocket,
	level_ring,
	#Огромные уровни
	level_heart,
	level_paw
]

var last_background = load("res://Sprites/Backgrounds/Relax_purple.png")

var background_back_1 = load("res://Sprites/Backgrounds/back_1.png")
var background_back_2 = load("res://Sprites/Backgrounds/back_2.png")
var background_back_3 = load("res://Sprites/Backgrounds/back_3.png")
var background_flowers = load("res://Sprites/Backgrounds/flowers.png")
var background_relax_purple = load("res://Sprites/Backgrounds/Relax_purple.png")

var all_backgrounds = [
	background_back_1,
	background_back_2,
	background_back_3,
	background_flowers,
	background_relax_purple
]
