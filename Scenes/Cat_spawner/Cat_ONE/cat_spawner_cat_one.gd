extends Node2D

@onready var sprite_cat = %Sprite_cat
@onready var label_count = %Label_count

@onready var cats = %Cats

@export var texture_cat := preload("res://Sprites/Cats/Cat_ONE/Cat_One.png")
@export var scene_cat := preload("res://Scenes/Cats/Cat_ONE/cat_one.tscn")

@export var max_count := 3
var count := 0

var data_cat := []

func _ready():
	get_cat(texture_cat, scene_cat, max_count)
	check_pickable_cats()

func _process(delta):
	if count == 0:
		sprite_cat.modulate = "000000"
	else:
		sprite_cat.modulate = "ffffff"
	

# Принимает текстуру Кота, который будет создан, сцену и кол-во
func get_cat(texture_cat, scene_cat, max_count: int): 
	sprite_cat.texture = texture_cat
	count = max_count
	label_count.text = str(max_count)
	for i in max_count:
		cats.add_child(scene_cat.instantiate())
	data_cat = cats.get_children()
	for i in max_count:
		data_cat[i].get_start_position()

func check_pickable_cats(): # ЗДЕСЬ ОШИБКА ИЗ-ЗА ТОГО, ЧТО COUNT МЕНЬШЕ ЧЕМ ВСЕГО КОТОВ!!
	for i in max_count: 
		if data_cat[i].global_position != position:
			data_cat[i].input_pickable = true
		else:
			data_cat[i].input_pickable = false
	for i in max_count:
		if data_cat[i].global_position == position:
			data_cat[i].input_pickable = true
			break
		



func count_cat_minus(): # Убавляем кол-во котов
	if count != 0:
		var cat_index_0 = data_cat[0] 
		data_cat.append(cat_index_0)
		data_cat.remove_at(0)
		count -= 1 
		label_count.text = str(count)

func count_cat_plus(): # Прибавляем кол-во котов
	if count != max_count: 
		var cat_index_end = data_cat[-1]
		data_cat.push_front(cat_index_end)
		data_cat.remove_at(max_count)
		count += 1
		label_count.text = str(count)
