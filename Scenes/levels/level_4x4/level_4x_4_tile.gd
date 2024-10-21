extends Node2D


@onready var container_spawn_1 = %Container_spawn_1
@onready var container_spawn_2 = %Container_spawn_2
@onready var container_spawn_3 = %Container_spawn_3
@onready var container_spawn_4 = %Container_spawn_4
@onready var container_spawn_5 = %Container_spawn_5
@onready var container_spawn_6 = %Container_spawn_6

@onready var cats = %Cats


var cats_start = ["Cat_I", "Cat_J", "Cat_L", "Cat_o", "Cat_ONE", "Cat_S", "Cat_T", "Cat_Z"]

func _ready():
	cat_start_good_combo_1()


# КОМБО 1
func cat_start_good_combo_1():
	var cats_combo_1 = ["Cat_I", "Cat_o"]
	var cats_not_combo_1 = ["Cat_J", "Cat_L", "Cat_ONE", "Cat_S", "Cat_T", "Cat_Z"]
	
	var count_max_spawner = 4
	
	for i in count_max_spawner:
		var new_cat = cats_not_combo_1.pick_random()
		while new_cat in cats_combo_1:
			new_cat = cats_not_combo_1.pick_random()
		cats_combo_1.append(new_cat)
	randomize()
	cats_combo_1.shuffle()
	start_game_combo_1(cats_combo_1)


func start_game_combo_1(actual_combo):
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
			scene_new.max_count = 2
			cats.add_child(scene_new)
			if actual_spawner.global_position.y > 0:
				scene_new.global_position = actual_spawner.global_position + Vector2(-44, 0)
			else:
				scene_new.global_position = actual_spawner.global_position + Vector2(-44, 44)
		elif actual_combo[i] == "Cat_J":
			var scene_new = preload("res://Scenes/Cat_spawner/Cat_J/cat_spawner_cat_j.tscn").instantiate()
			scene_new.max_count = randi_range(1, 3)
			cats.add_child(scene_new)
			scene_new.global_position = actual_spawner.global_position
		elif actual_combo[i] == "Cat_L":
			var scene_new = preload("res://Scenes/Cat_spawner/Cat_L/cat_spawner_cat_L.tscn").instantiate()
			scene_new.max_count = randi_range(1, 3)
			cats.add_child(scene_new)
			scene_new.global_position = actual_spawner.global_position
		elif actual_combo[i] == "Cat_o":
			var scene_new = preload("res://Scenes/Cat_spawner/Cat_o/cat_spawner_cat_o.tscn").instantiate()
			scene_new.max_count = 2
			cats.add_child(scene_new)
			scene_new.global_position = actual_spawner.global_position
		elif actual_combo[i] == "Cat_ONE":
			var scene_new = preload("res://Scenes/Cat_spawner/Cat_ONE/cat_spawner_cat_one.tscn").instantiate()
			scene_new.max_count = randi_range(1, 3)
			cats.add_child(scene_new)
			scene_new.global_position = actual_spawner.global_position + Vector2(-44, 44)
		elif actual_combo[i] == "Cat_S":
			var scene_new = preload("res://Scenes/Cat_spawner/Cat_S/cat_spawner_cat_s.tscn").instantiate()
			scene_new.max_count = randi_range(1, 3)
			cats.add_child(scene_new)
			scene_new.global_position = actual_spawner.global_position + Vector2(-44, 0)
		elif actual_combo[i] == "Cat_T":
			var scene_new = preload("res://Scenes/Cat_spawner/Cat_T/cat_spawner_cat_t.tscn").instantiate()
			scene_new.max_count = randi_range(1, 3)
			cats.add_child(scene_new)
			scene_new.global_position = actual_spawner.global_position + Vector2(-44, 0)
		elif actual_combo[i] == "Cat_Z":
			var scene_new = preload("res://Scenes/Cat_spawner/Cat_Z/cat_spawner_cat_z.tscn").instantiate()
			scene_new.max_count = randi_range(1, 3)
			cats.add_child(scene_new)
			scene_new.global_position = actual_spawner.global_position + Vector2(-44, 0)



func cat_start_good_combo_2():
	var cats_combo_2 = ["Cat_L", "Cat_J"]
func cat_start_good_combo_3():
	var cats_combo_3 = ["Cat_T", "Cat_L", "Cat_I"]
func cat_start_good_combo_4():
	var cats_combo_4 = ["Cat_L", "Cat_J", "Cat_o", "Cat_I"]
func cat_start_good_combo_5():
	var cats_combo_5 = ["Cat_L", "Cat_J", "Cat_Z", "Cat_I"]
func cat_start_good_combo_6():
	var cats_combo_6 = ["Cat_ONE", "Cat_L", "Cat_o"]
func cat_start_good_combo_7():
	var cats_combo_7 = ["Cat_T", "Cat_S", "Cat_J"]




func _on_button_pressed():
	for i in cats.get_children():
		cats.remove_child(i)
	cat_start_good_combo_1()
