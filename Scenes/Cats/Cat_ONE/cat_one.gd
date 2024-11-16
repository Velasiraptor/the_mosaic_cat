extends CharacterBody2D

@export var count_tile_in_cat := 1
@export var full_tiles := 1
@export var active := true
@export var grid_size = 88


@onready var sprite_cat_one = %Sprite_Cat_ONE
@onready var collision_touch = %Collision_touch

@onready var cat_one_animation = %Cat_ONE_animation


var start_position := Vector2()

var dragging = false  # Флаг перетаскивания
var drag_offset = Vector2()  # Смещение между объектом и мышью

signal dragsignal  # Сигнал для начала/остановки перетаскивания

func _ready():
	# Подключаем сигнал с использованием Callable
	connect("dragsignal", Callable(self, "_set_drag_pc"))
	rotation_degrees = 0
	#start_position = global_position
	sprite_cat_one.visible = true
	cat_one_animation.visible = false
	cat_one_animation.stop()
	collision_touch.scale = Vector2(2, 2)


func _physics_process(delta):
	if dragging and active:
		var mousepos = get_viewport().get_mouse_position()
		self.position = mousepos - drag_offset  # Учитываем смещение
		rotate_cat_button()
	if Input.is_action_just_released("click") and dragging:
		not_dragging()

func _set_drag_pc():
	dragging = !dragging
	if dragging:
		var mousepos = get_viewport().get_mouse_position()
		self.global_position = get_global_mouse_position() + Vector2(-44, 44) + Vector2(0, -176) #для телефона
		drag_offset = mousepos - self.position  # Рассчитываем смещение при начале перетаскивания


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and not dragging:
			emit_signal("dragsignal")  # Начало перетаскивания
			dragging = true
			
			Global.check_rotate_cat = true
			
			#анимация
			sprite_cat_one.visible = false
			cat_one_animation.visible = true
			cat_one_animation.play()
			
			if abs(position.x - get_parent().position.x) <= 400 and abs(position.y - get_parent().position.y) <= 400:
				get_tree().call_group("Spawner_Cat_ONE", "count_cat_minus") # Вычитаем надпись у спаунера
			collision_touch.scale = Vector2(6, 6)
			sprite_cat_one.z_index = 1
			cat_one_animation.z_index = 1
		elif !event.pressed and dragging:
			not_dragging()

func not_dragging():
	emit_signal("dragsignal")  # Окончание перетаскивания
	dragging = false
	
	Global.check_rotate_cat = false
	
	#анимация
	sprite_cat_one.visible = true
	cat_one_animation.visible = false
	cat_one_animation.stop()
	
	collision_touch.scale = Vector2(1, 1)
	sprite_cat_one.z_index = 0
	cat_one_animation.z_index = 0
	if count_tile_in_cat != 0:
		self.position = start_position # Возвращение к стартовой позиции
		get_tree().call_group("Spawner_Cat_ONE", "count_cat_plus") # Прибавляем надпись у спаунера
		get_tree().call_group("Spawner_Cat_ONE", "check_pickable_cats")
		collision_touch.scale = Vector2(2, 2)
		sprite_cat_one.rotation_degrees = 0
		cat_one_animation.rotation_degrees = 0
		await  get_tree().create_timer(0.05).timeout
		count_tile_in_cat = full_tiles
	elif count_tile_in_cat == 0:
		self.global_position = snap_to_grid(self.global_position)
		get_tree().call_group("Spawner_Cat_ONE", "check_pickable_cats")
		await get_tree().create_timer(0.05).timeout #ПРОВЕРКА ЕСЛИ КОТ НЕПРАВИЛЬНО ВСТАЛ
		if count_tile_in_cat != 0 and not dragging:
			self.position = start_position # Возвращение к стартовой позиции
			get_tree().call_group("Spawner_Cat_ONE", "count_cat_plus") # Прибавляем надпись у спаунера
			get_tree().call_group("Spawner_Cat_ONE", "check_pickable_cats")
			rotation_degrees = 0
			collision_touch.scale = Vector2(2, 2)
			await get_tree().create_timer(0.05).timeout
			count_tile_in_cat = full_tiles 
	get_tree().call_group("Level", "finish_game")

func cat_completed_minus():
	count_tile_in_cat -= 1
func cat_completed_plus():
	count_tile_in_cat += 1


# Функция для привязки позиции объекта к сетке
func snap_to_grid(position: Vector2) -> Vector2:
	var x = round(position.x / grid_size) * grid_size
	var y = round(position.y / grid_size) * grid_size
	return Vector2(x, y)

func rotate_cat_button():
	if Input.is_action_just_pressed("rotate_cat"):
		sprite_cat_one.rotation_degrees += 90
		cat_one_animation.rotation_degrees += 90
		
		sprite_cat_one.visible = false
		cat_one_animation.visible = true
		

func get_start_position(): #Принимаем позицию спаунера
	
	start_position = get_parent().position
