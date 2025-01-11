extends Node

@onready var all_classic_music = %All_classic_music


@onready var music_1 = %Music_1
@onready var music_2 = %Music_2

var random_index = 0


func _ready():
	start_random_music().play()



func _on_music_1_finished():
	await get_tree().create_timer(10.0).timeout
	next_random_music().play()


func _on_music_2_finished():
	await get_tree().create_timer(10.0).timeout
	next_random_music().play()


func start_random_music():
	var all_music = all_classic_music.get_children()
	random_index = randi() % all_music.size()
	return all_music[random_index]

func  next_random_music(): # с исключением прошлого трека
	var all_music = all_classic_music.get_children()
	
	var next_music = randi() % all_music.size()
	while next_music == random_index:
		next_music = randi() % all_music.size()
	return all_music[next_music]
