extends CanvasLayer

@export var B_time := 10.0
@export var C_time := 10.0

@onready var timer_b = %Timer_B
@onready var timer_c = %Timer_C


@export var color_A := Color("81a315")
@export var color_B := Color("b6ac1a")
@export var color_C := Color("a92501")

@onready var label_time = %Label_time
@onready var timer = %Timer



func _ready():
	timer.wait_time = B_time + C_time
	timer_b.wait_time = B_time
	timer_c.wait_time = C_time
	label_time.modulate = color_A
	timer.start()
	timer_b.start()

func _process(delta):
	label_time.text = "%02d:%02d" % time_left_to_live()

func time_left_to_live():
	var time_left = timer.time_left
	var minute = floor(time_left / 60)
	var second = int(time_left) % 60
	return [minute, second]

func timer_yellow():
	label_time.modulate = color_B
func timer_red():
	label_time.modulate = color_C

func timer_victory_stop():
	timer.stop()


func _on_timer_b_timeout():
	get_tree().call_group("Window_next_lvl", "rating_B") #Берем функцию из "window_next_lvl"
	timer_c.start()

func _on_timer_c_timeout():
	get_tree().call_group("Window_next_lvl", "rating_C") #Берем функцию из "window_next_lvl"
