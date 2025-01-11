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
var level_bread = load("res://Scenes/levels/level_bread/level_bread.tscn")
var level_coffee = load("res://Scenes/levels/level_coffee/level_coffee.tscn")
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
	level_bread,
	level_coffee,
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
var background_back_4 = load("res://Sprites/Backgrounds/back_4.png")
var background_back_5 = load("res://Sprites/Backgrounds/back_5.png")
var background_back_6 = load("res://Sprites/Backgrounds/back_6.png")
var background_back_7 = load("res://Sprites/Backgrounds/back_7.png")
var background_back_8 = load("res://Sprites/Backgrounds/back_8.png")
var background_back_9 = load("res://Sprites/Backgrounds/back_9.png")
var background_back_10 = load("res://Sprites/Backgrounds/back_10.png")
var background_back_11 = load("res://Sprites/Backgrounds/back_11.png")
var background_back_12 = load("res://Sprites/Backgrounds/back_12.png")
var background_back_13 = load("res://Sprites/Backgrounds/back_13.png")
var background_back_14 = load("res://Sprites/Backgrounds/back_14.png")
var background_back_15 = load("res://Sprites/Backgrounds/back_15.png")
var background_back_16 = load("res://Sprites/Backgrounds/back_16.png")
var background_back_17 = load("res://Sprites/Backgrounds/back_17.png")
var background_back_18 = load("res://Sprites/Backgrounds/back_18.png")

var all_backgrounds = [
	background_back_1,
	background_back_2,
	background_back_3,
	background_flowers,
	background_relax_purple,
	background_back_4,
	background_back_5,
	background_back_6,
	background_back_7,
	background_back_8,
	background_back_9,
	background_back_10,
	background_back_11,
	background_back_12,
	background_back_13,
	background_back_14,
	background_back_15,
	background_back_16,
	background_back_17,
	background_back_18
]
