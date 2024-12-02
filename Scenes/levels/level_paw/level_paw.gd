extends Node2D


@onready var container_spawn_1 = %Container_spawn_1
@onready var container_spawn_2 = %Container_spawn_2
@onready var container_spawn_3 = %Container_spawn_3
@onready var container_spawn_4 = %Container_spawn_4
@onready var container_spawn_5 = %Container_spawn_5
@onready var container_spawn_6 = %Container_spawn_6
@onready var container_spawn_7 = %Container_spawn_7
@onready var container_spawn_8 = %Container_spawn_8

@onready var level_zone = %Level_zone

@onready var button_rotate = %Button_ROTATE

@onready var playing_field = %Playing_field

@onready var cats = %Cats


var full_tile := 58 # кол-во игровых клеток
@onready var timer_check_finish = %Timer_check_finish

var cats_start = ["Cat_I", "Cat_J", "Cat_L", "Cat_o", "Cat_ONE", "Cat_S", "Cat_T", "Cat_Z"]

func _physics_process(delta):
	scale_button_rotate()

func _ready():
	random_combo()
	rotate_level()
	mirror_level()

func finish_game():
	timer_check_finish.start()
	var victory_count_tile = full_tile
	for i in playing_field.get_children():
		if i.modulate != Color(1, 1, 1, 1):
			victory_count_tile -= 1
	if victory_count_tile == 0:
		timer_check_finish.stop()
		var next_lvl = Global.all_levels
		next_lvl = next_lvl.pick_random()
		while next_lvl == Global.last_lvl:
			next_lvl = Global.all_levels
			next_lvl = next_lvl.pick_random()
		Global.last_lvl = next_lvl
		get_parent().add_child(next_lvl.instantiate())
		queue_free()

func _on_timer_check_finish_timeout():
	var victory_count_tile = full_tile
	for i in playing_field.get_children():
		if i.modulate != Color(1, 1, 1, 1):
			victory_count_tile -= 1
	if victory_count_tile == 0:
		var next_lvl = Global.all_levels
		next_lvl = next_lvl.pick_random()
		while next_lvl == Global.last_lvl:
			next_lvl = Global.all_levels
			next_lvl = next_lvl.pick_random()
		Global.last_lvl = next_lvl
		get_parent().add_child(next_lvl.instantiate())
		queue_free()

func scale_button_rotate():
	if Global.check_rotate_cat == false:
		button_rotate.scale.x = 6
	else:
		button_rotate.scale.x = 30

func mirror_level():
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
	var rndm_number = randi_range(0, 4)
	if rndm_number == 0:
		level_zone.rotation_degrees = 0
	elif rndm_number == 1:
		level_zone.rotation_degrees = 90
	elif rndm_number == 2:
		level_zone.rotation_degrees = 180
	elif rndm_number == 3:
		level_zone.rotation_degrees = 270

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
	var cats_combo_1 = ["Cat_I", "Cat_o", "Cat_J", "Cat_Z", "Cat_ONE", "Cat_L", "Cat_S", "Cat_T"]
	
	randomize()
	cats_combo_1.shuffle()
	start_combo(cats_combo_1, randi_range(1, 2), randi_range(1, 2), 2, 2, randi_range(6, 8), \
	3, 3, 2)



# комбо 2
func cat_good_combo_2():
	var cats_combo_2 = ["Cat_I", "Cat_o", "Cat_J", "Cat_Z", "Cat_ONE", "Cat_L", "Cat_S", "Cat_T"]
	
	randomize()
	cats_combo_2.shuffle()
	start_combo(cats_combo_2, randi_range(1, 2), 2, 1, 2, randi_range(6, 8), \
	2, 5, randi_range(1, 2))


# комбо 3
func cat_good_combo_3():
	var cats_combo_3 = ["Cat_I", "Cat_o", "Cat_J", "Cat_Z", "Cat_ONE", "Cat_L", "Cat_S", "Cat_T"]
	
	randomize()
	cats_combo_3.shuffle()
	start_combo(cats_combo_3, randi_range(1, 2), 2, 2, 2, randi_range(6, 7), \
	randi_range(1, 2), 2, 3)


# комбо 4
func cat_good_combo_4():
	var cats_combo_4 = ["Cat_I", "Cat_o", "Cat_J", "Cat_Z", "Cat_ONE", "Cat_L", "Cat_S", "Cat_T"]
	
	randomize()
	cats_combo_4.shuffle()
	start_combo(cats_combo_4, 1, 5, randi_range(1, 2), 3, randi_range(6, 7), \
	randi_range(1, 2), 2, randi_range(1, 2))


# комбо 5
func cat_good_combo_5():
	var cats_combo_5 = ["Cat_I", "Cat_o", "Cat_J", "Cat_Z", "Cat_ONE", "Cat_L", "Cat_S", "Cat_T"]
	
	randomize()
	cats_combo_5.shuffle()
	start_combo(cats_combo_5, 2, 2, randi_range(1, 2), randi_range(1, 2), randi_range(6, 7), \
	2, 3, 2)



# комбо 6
func cat_good_combo_6():
	var cats_combo_6 = ["Cat_I", "Cat_o", "Cat_J", "Cat_Z", "Cat_ONE", "Cat_L", "Cat_S", "Cat_T"]
	
	randomize()
	cats_combo_6.shuffle()
	start_combo(cats_combo_6, randi_range(1, 2), 2, 2, 5, randi_range(6, 7), \
	randi_range(1, 2), 2, randi_range(1, 2))


# комбо 7
func cat_good_combo_7():
	var cats_combo_7 = ["Cat_I", "Cat_o", "Cat_J", "Cat_Z", "Cat_ONE", "Cat_L", "Cat_S", "Cat_T"]
	
	randomize()
	cats_combo_7.shuffle()
	start_combo(cats_combo_7, randi_range(1, 2), 1, 2, randi_range(1, 2), 10, \
	5, randi_range(1, 2), 1)



#Функция на кол-во котов в комбо
func start_combo(actual_combo, I_count, J_count, L_count, O_count, ONE_count, S_count, T_count, Z_count):
	for i in 8:
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
		elif i == 6:
			actual_spawner = container_spawn_7
		elif i == 7:
			actual_spawner = container_spawn_8

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




func _on_button_restart_pressed():
	for i in cats.get_children():
		cats.remove_child(i)
	random_combo()

func _on_button_skip_pressed():
	var next_lvl = Global.all_levels
	next_lvl = next_lvl.pick_random()
	while next_lvl == Global.last_lvl:
		next_lvl = Global.all_levels
		next_lvl = next_lvl.pick_random()
	Global.last_lvl = next_lvl
	get_parent().add_child(next_lvl.instantiate())
	queue_free()
