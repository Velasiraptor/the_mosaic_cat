extends CharacterBody2D

func _ready():
	name = get_parent().name

func cat_completed_minus():
	get_parent().cat_completed_minus()
func cat_completed_plus():
	get_parent().cat_completed_plus()
