extends CharacterBody2D

@export var count_tile_in_cat := 4
@export var full_tiles := 4
@export var active := true
@export var grid_size = 88


@onready var sprite_cat_o = %Sprite_Cat_O
@onready var collision_touch = %Collision_touch


var start_position := Vector2()

var dragging = false  # Флаг перетаскивания
var drag_offset = Vector2()  # Смещение между объектом и мышью


signal dragsignal  # Сигнал для начала/остановки перетаскивания

func _ready():
	# Подключаем сигнал с использованием Callable
	connect("dragsignal", Callable(self, "_set_drag_pc"))
	start_position = global_position
	rotation_degrees = 0
	
	

func _process(delta):
	if dragging and active:
		var mousepos = get_viewport().get_mouse_position()
		self.position = mousepos - drag_offset  # Учитываем смещение
		rotate_cat_button()

func _set_drag_pc():
	dragging = !dragging
	if dragging:
		var mousepos = get_viewport().get_mouse_position()
		drag_offset = mousepos - self.position  # Рассчитываем смещение при начале перетаскивания


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			emit_signal("dragsignal")  # Начало перетаскивания
			collision_touch.scale = Vector2(4, 4)
			sprite_cat_o.z_index = 1
		elif event.button_index == MOUSE_BUTTON_LEFT and !event.pressed:
			if dragging:
				emit_signal("dragsignal")  # Окончание перетаскивания
				collision_touch.scale = Vector2(1, 1)
				sprite_cat_o.z_index = 0
				if count_tile_in_cat != 0:
					self.position = start_position # Возвращение к стартовой позиции
					rotation_degrees = 0
					await  get_tree().create_timer(0.2).timeout
					count_tile_in_cat = full_tiles 
				elif count_tile_in_cat == 0:
					var mousepos = get_viewport().get_mouse_position()
					var snapped_position = snap_to_grid(mousepos - drag_offset)
					self.position = snapped_position


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
		rotation_degrees += 90
	
