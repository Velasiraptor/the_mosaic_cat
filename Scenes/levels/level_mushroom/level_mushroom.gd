extends Node2D

@export var active_mirror := true ##кнопка вкл/выкл отзеркаливания уровня
@export var active_rotate := true ##кнопка вкл/выкл переворачивания уровня

@export var combo_1 = {
	"I cat": [1, 1],
	"J cat": [1, 1],
	"L cat": [1, 1],
	"O cat": [1, 1],
	"One cat": [1, 1],
	"S cat": [1, 1],
	"T cat": [1, 1],
	"Z cat": [1, 1]
}

@export var combo_2 = {
	"I cat": [1, 1],
	"J cat": [1, 1],
	"L cat": [1, 1],
	"O cat": [1, 1],
	"One cat": [1, 1],
	"S cat": [1, 1],
	"T cat": [1, 1],
	"Z cat": [1, 1]
}

@export var combo_3 = {
	"I cat": [1, 1],
	"J cat": [1, 1],
	"L cat": [1, 1],
	"O cat": [1, 1],
	"One cat": [1, 1],
	"S cat": [1, 1],
	"T cat": [1, 1],
	"Z cat": [1, 1]
}

@export var combo_4 = {
	"I cat": [1, 1],
	"J cat": [1, 1],
	"L cat": [1, 1],
	"O cat": [1, 1],
	"One cat": [1, 1],
	"S cat": [1, 1],
	"T cat": [1, 1],
	"Z cat": [1, 1]
}

@export var combo_5 = {
	"I cat": [1, 1],
	"J cat": [1, 1],
	"L cat": [1, 1],
	"O cat": [1, 1],
	"One cat": [1, 1],
	"S cat": [1, 1],
	"T cat": [1, 1],
	"Z cat": [1, 1]
}
@export var combo_6 = {
	"I cat": [1, 1],
	"J cat": [1, 1],
	"L cat": [1, 1],
	"O cat": [1, 1],
	"One cat": [1, 1],
	"S cat": [1, 1],
	"T cat": [1, 1],
	"Z cat": [1, 1]
}
@export var combo_7 = {
	"I cat": [1, 1],
	"J cat": [1, 1],
	"L cat": [1, 1],
	"O cat": [1, 1],
	"One cat": [1, 1],
	"S cat": [1, 1],
	"T cat": [1, 1],
	"Z cat": [1, 1]
}

@onready var container_spawn_1 = %Container_spawn_1
@onready var container_spawn_2 = %Container_spawn_2
@onready var container_spawn_3 = %Container_spawn_3
@onready var container_spawn_4 = %Container_spawn_4
@onready var container_spawn_5 = %Container_spawn_5
@onready var container_spawn_6 = %Container_spawn_6


@onready var cats = %Cats

@onready var button_rotate = %Button_ROTATE

@onready var level_zone = %Level_zone

@onready var playing_field = %Playing_field

@onready var camera_2d = %Camera2D


@export var full_tile := 30 # кол-во игровых клеток
@onready var timer_check_finish = %Timer_check_finish

@onready var window_next_lvl = %Window_next_lvl


var cats_start = ["Cat_I", "Cat_J", "Cat_L", "Cat_o", "Cat_ONE", "Cat_S", "Cat_T", "Cat_Z"]

func _ready():
	position_spawners()
	random_combo()
	rotate_level()
	mirror_level()



func _physics_process(delta):
	scale_button_rotate()

func position_spawners():
	var offset = 450
	# Получаем видимую область камеру
	var camera_size  = get_viewport_rect().size / camera_2d.zoom
	
	# Левый и правый край видимой области
	var left_edge = camera_2d.global_position.x - (camera_size.x / 2)
	var right_edge = camera_2d.global_position.x + (camera_size.x / 2)
	
	container_spawn_1.global_position.x = left_edge + offset
	container_spawn_2.global_position.x = left_edge + offset
	container_spawn_3.global_position.x = left_edge + offset
	container_spawn_4.global_position.x = right_edge - offset
	container_spawn_5.global_position.x = right_edge - offset
	container_spawn_6.global_position.x = right_edge - offset

func finish_game():
	timer_check_finish.start()
	var victory_count_tile = full_tile
	for i in playing_field.get_children():
		if i.modulate != Color(1, 1, 1, 1):
			victory_count_tile -= 1
	if victory_count_tile == 0:
		timer_check_finish.stop()
		window_visible()

func _on_timer_check_finish_timeout():
	var victory_count_tile = full_tile
	for i in playing_field.get_children():
		if i.modulate != Color(1, 1, 1, 1):
			victory_count_tile -= 1
	if victory_count_tile == 0:
		window_visible()

func window_visible():
	window_next_lvl.visible = true
	window_next_lvl.animation_window()

func scale_button_rotate():
	if Global.check_rotate_cat == false:
		button_rotate.scale.x = 6
	else:
		button_rotate.scale.x = 100

func random_combo():
	var random_number = randi_range(1, 7)
	if random_number == 1:
		cat_good_combo_1()
	elif random_number == 2:
		cat_good_combo_2()
	elif random_number == 3:
		cat_good_combo_3()
	elif random_number == 4:
		cat_good_combo_4()
	elif random_number == 5:
		cat_good_combo_5()
	elif random_number == 6:
		cat_good_combo_6()
	elif random_number == 7:
		cat_good_combo_7()

# КОМБО 1
func cat_good_combo_1():
	var cats_combo_1 = ["Cat_I", "Cat_L", "Cat_o", "Cat_ONE", "Cat_Z"]
	var cats_not_combo_1 = ["Cat_J", "Cat_S", "Cat_T"]
	
	var count_max_spawner = 1 # сколько добавить пустышек
	
	for i in count_max_spawner:
		var new_cat = cats_not_combo_1.pick_random()
		while new_cat in cats_combo_1:
			new_cat = cats_not_combo_1.pick_random()
		cats_combo_1.append(new_cat)
	randomize()
	cats_combo_1.shuffle()
	start_combo(cats_combo_1, randi_range(combo_1["I cat"][0], combo_1["I cat"][1]), \
	randi_range(combo_1["J cat"][0], combo_1["J cat"][1]), \
	randi_range(combo_1["L cat"][0], combo_1["L cat"][1]), \
	randi_range(combo_1["O cat"][0], combo_1["O cat"][1]), \
	randi_range(combo_1["One cat"][0], combo_1["One cat"][1]), \
	randi_range(combo_1["S cat"][0], combo_1["S cat"][1]), \
	randi_range(combo_1["T cat"][0], combo_1["T cat"][1]), \
	randi_range(combo_1["Z cat"][0], combo_1["Z cat"][1]))



# комбо 2
func cat_good_combo_2():
	var cats_combo_2 = ["Cat_I", "Cat_J", "Cat_L", "Cat_S", "Cat_Z"]
	var cats_not_combo_2 = ["Cat_o", "Cat_ONE", "Cat_T"]
	
	var count_max_spawner = 1 # сколько добавить пустышек
	
	for i in count_max_spawner:
		var new_cat = cats_not_combo_2.pick_random()
		while new_cat in cats_combo_2:
			new_cat = cats_not_combo_2.pick_random()
		cats_combo_2.append(new_cat)
	randomize()
	start_combo(cats_combo_2, randi_range(combo_2["I cat"][0], combo_2["I cat"][1]), \
	randi_range(combo_2["J cat"][0], combo_2["J cat"][1]), \
	randi_range(combo_2["L cat"][0], combo_2["L cat"][1]), \
	randi_range(combo_2["O cat"][0], combo_2["O cat"][1]), \
	randi_range(combo_2["One cat"][0], combo_2["One cat"][1]), \
	randi_range(combo_2["S cat"][0], combo_2["S cat"][1]), \
	randi_range(combo_2["T cat"][0], combo_2["T cat"][1]), \
	randi_range(combo_2["Z cat"][0], combo_2["Z cat"][1]))


# комбо 3
func cat_good_combo_3():
	var cats_combo_3 = ["Cat_I", "Cat_J", "Cat_o", "Cat_Z"]
	var cats_not_combo_3 = ["Cat_L", "Cat_ONE", "Cat_S", "Cat_T"]
	
	var count_max_spawner = 2 # сколько добавить пустышек
	
	for i in count_max_spawner:
		var new_cat = cats_not_combo_3.pick_random()
		while new_cat in cats_combo_3:
			new_cat = cats_not_combo_3.pick_random()
		cats_combo_3.append(new_cat)
	randomize()
	cats_combo_3.shuffle()
	start_combo(cats_combo_3, randi_range(combo_3["I cat"][0], combo_3["I cat"][1]), \
	randi_range(combo_3["J cat"][0], combo_3["J cat"][1]), \
	randi_range(combo_3["L cat"][0], combo_3["L cat"][1]), \
	randi_range(combo_3["O cat"][0], combo_3["O cat"][1]), \
	randi_range(combo_3["One cat"][0], combo_3["One cat"][1]), \
	randi_range(combo_3["S cat"][0], combo_3["S cat"][1]), \
	randi_range(combo_3["T cat"][0], combo_3["T cat"][1]), \
	randi_range(combo_3["Z cat"][0], combo_3["Z cat"][1]))


# комбо 4
func cat_good_combo_4():
	var cats_combo_4 = ["Cat_J", "Cat_L"]
	var cats_not_combo_4 = ["Cat_I", "Cat_o", "Cat_ONE", "Cat_S", "Cat_T", "Cat_Z"]
	
	var count_max_spawner = 4 # сколько добавить пустышек
	
	for i in count_max_spawner:
		var new_cat = cats_not_combo_4.pick_random()
		while new_cat in cats_combo_4:
			new_cat = cats_not_combo_4.pick_random()
		cats_combo_4.append(new_cat)
	randomize()
	cats_combo_4.shuffle()
	start_combo(cats_combo_4, randi_range(combo_4["I cat"][0], combo_4["I cat"][1]), \
	randi_range(combo_4["J cat"][0], combo_4["J cat"][1]), \
	randi_range(combo_4["L cat"][0], combo_4["L cat"][1]), \
	randi_range(combo_4["O cat"][0], combo_4["O cat"][1]), \
	randi_range(combo_4["One cat"][0], combo_4["One cat"][1]), \
	randi_range(combo_4["S cat"][0], combo_4["S cat"][1]), \
	randi_range(combo_4["T cat"][0], combo_4["T cat"][1]), \
	randi_range(combo_4["Z cat"][0], combo_4["Z cat"][1]))


# комбо 5
func cat_good_combo_5():
	var cats_combo_5 = ["Cat_J", "Cat_ONE", "Cat_S", "Cat_T"]
	var cats_not_combo_5 = ["Cat_I", "Cat_L", "Cat_o", "Cat_Z"]
	
	var count_max_spawner = 2 # сколько добавить пустышек
	
	for i in count_max_spawner:
		var new_cat = cats_not_combo_5.pick_random()
		while new_cat in cats_combo_5:
			new_cat = cats_not_combo_5.pick_random()
		cats_combo_5.append(new_cat)
	randomize()
	cats_combo_5.shuffle()
	start_combo(cats_combo_5, randi_range(combo_5["I cat"][0], combo_5["I cat"][1]), \
	randi_range(combo_5["J cat"][0], combo_5["J cat"][1]), \
	randi_range(combo_5["L cat"][0], combo_5["L cat"][1]), \
	randi_range(combo_5["O cat"][0], combo_5["O cat"][1]), \
	randi_range(combo_5["One cat"][0], combo_5["One cat"][1]), \
	randi_range(combo_5["S cat"][0], combo_5["S cat"][1]), \
	randi_range(combo_5["T cat"][0], combo_5["T cat"][1]), \
	randi_range(combo_5["Z cat"][0], combo_5["Z cat"][1]))



# комбо 6
func cat_good_combo_6():
	var cats_combo_6 = ["Cat_ONE", "Cat_S", "Cat_T", "Cat_Z"]
	var cats_not_combo_6 = ["Cat_I", "Cat_J", "Cat_L", "Cat_o"]
	
	var count_max_spawner = 2 # сколько добавить пустышек
	
	for i in count_max_spawner:
		var new_cat = cats_not_combo_6.pick_random()
		while new_cat in cats_combo_6:
			new_cat = cats_not_combo_6.pick_random()
		cats_combo_6.append(new_cat)
	randomize()
	cats_combo_6.shuffle()
	start_combo(cats_combo_6, randi_range(combo_6["I cat"][0], combo_6["I cat"][1]), \
	randi_range(combo_6["J cat"][0], combo_6["J cat"][1]), \
	randi_range(combo_6["L cat"][0], combo_6["L cat"][1]), \
	randi_range(combo_6["O cat"][0], combo_6["O cat"][1]), \
	randi_range(combo_6["One cat"][0], combo_6["One cat"][1]), \
	randi_range(combo_6["S cat"][0], combo_6["S cat"][1]), \
	randi_range(combo_6["T cat"][0], combo_6["T cat"][1]), \
	randi_range(combo_6["Z cat"][0], combo_6["Z cat"][1]))


# комбо 7
func cat_good_combo_7():
	var cats_combo_7 = ["Cat_L", "Cat_ONE", "Cat_T", "Cat_Z"]
	var cats_not_combo_7 = ["Cat_I", "Cat_J", "Cat_o", "Cat_S"]
	
	var count_max_spawner = 2 # сколько добавить пустышек
	
	for i in count_max_spawner:
		var new_cat = cats_not_combo_7.pick_random()
		while new_cat in cats_combo_7:
			new_cat = cats_not_combo_7.pick_random()
		cats_combo_7.append(new_cat)
	randomize()
	cats_combo_7.shuffle()
	start_combo(cats_combo_7, randi_range(combo_7["I cat"][0], combo_7["I cat"][1]), \
	randi_range(combo_7["J cat"][0], combo_7["J cat"][1]), \
	randi_range(combo_7["L cat"][0], combo_7["L cat"][1]), \
	randi_range(combo_7["O cat"][0], combo_7["O cat"][1]), \
	randi_range(combo_7["One cat"][0], combo_7["One cat"][1]), \
	randi_range(combo_7["S cat"][0], combo_7["S cat"][1]), \
	randi_range(combo_7["T cat"][0], combo_7["T cat"][1]), \
	randi_range(combo_7["Z cat"][0], combo_7["Z cat"][1]))



#Функция на кол-во котов в комбо
func start_combo(actual_combo, I_count, J_count, L_count, O_count, ONE_count, S_count, T_count, Z_count):
	for i in 6:
		var actual_spawner = ""
		if i == 0:
			actual_spawner = container_spawn_1
		elif i == 1:
			actual_spawner = container_spawn_2
		elif i == 2:
			actual_spawner = container_spawn_3
		elif i == 3:
			actual_spawner = container_spawn_4
		elif i == 4:
			actual_spawner = container_spawn_5
		elif i == 5:
			actual_spawner = container_spawn_6

		if actual_combo[i] == "Cat_I":
			var scene_new = preload("res://Scenes/Cat_spawner/Cat_I/cat_spawner_cat_i.tscn").instantiate()
			scene_new.max_count = I_count
			cats.add_child(scene_new)
			scene_new.global_position = actual_spawner.global_position
			scene_new.global_position += Vector2(0, 44)
		elif actual_combo[i] == "Cat_J":
			var scene_new = preload("res://Scenes/Cat_spawner/Cat_J/cat_spawner_cat_j.tscn").instantiate()
			scene_new.max_count = J_count
			cats.add_child(scene_new)
			scene_new.global_position = actual_spawner.global_position
			scene_new.global_position += Vector2(-44, 0)
		elif actual_combo[i] == "Cat_L":
			var scene_new = preload("res://Scenes/Cat_spawner/Cat_L/cat_spawner_cat_L.tscn").instantiate()
			scene_new.max_count = L_count
			cats.add_child(scene_new)
			scene_new.global_position = actual_spawner.global_position
		elif actual_combo[i] == "Cat_o":
			var scene_new = preload("res://Scenes/Cat_spawner/Cat_o/cat_spawner_cat_o.tscn").instantiate()
			scene_new.max_count = O_count
			cats.add_child(scene_new)
			scene_new.global_position = actual_spawner.global_position
		elif actual_combo[i] == "Cat_ONE":
			var scene_new = preload("res://Scenes/Cat_spawner/Cat_ONE/cat_spawner_cat_one.tscn").instantiate()
			scene_new.max_count = ONE_count
			cats.add_child(scene_new)
			scene_new.global_position = actual_spawner.global_position + Vector2(-44, 44)
		elif actual_combo[i] == "Cat_S":
			var scene_new = preload("res://Scenes/Cat_spawner/Cat_S/cat_spawner_cat_s.tscn").instantiate()
			scene_new.max_count = S_count
			cats.add_child(scene_new)
			scene_new.global_position = actual_spawner.global_position + Vector2(-44, 0)
		elif actual_combo[i] == "Cat_T":
			var scene_new = preload("res://Scenes/Cat_spawner/Cat_T/cat_spawner_cat_t.tscn").instantiate()
			scene_new.max_count = T_count
			cats.add_child(scene_new)
			scene_new.global_position = actual_spawner.global_position + Vector2(-44, 0)
		elif actual_combo[i] == "Cat_Z":
			var scene_new = preload("res://Scenes/Cat_spawner/Cat_Z/cat_spawner_cat_z.tscn").instantiate()
			scene_new.max_count = Z_count
			cats.add_child(scene_new)
			scene_new.global_position = actual_spawner.global_position + Vector2(-44, 0)

func mirror_level():
	if active_mirror:
		var rndm_number_x = randi_range(0, 2)
		var rndm_number_y = randi_range(0, 2)
		
		if rndm_number_x == 0:
			level_zone.scale.x = 1
		else:
			level_zone.scale.x = -1
		
		if rndm_number_y == 0:
			level_zone.scale.y = 1
		else:
			level_zone.scale.y = -1

func rotate_level():
	if active_rotate:
		var rndm_number = randi_range(0, 4)
		if rndm_number == 0:
			level_zone.rotation_degrees = 0
		elif rndm_number == 1:
			level_zone.rotation_degrees = 90
		elif rndm_number == 2:
			level_zone.rotation_degrees = 180
		elif rndm_number == 3:
			level_zone.rotation_degrees = 270
