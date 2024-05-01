extends Node2D

signal point

@onready var main = get_node("..")

var arrowScene = preload("res://scenes/second_level/cave_level/arrows.tscn")

var spawn_points = []

const MIN_TIME = 0.5

func _ready():
	TransitionScreen._fade_out()
	for i in get_children():
		if i is Marker2D:
			spawn_points.append(i)


func _on_spawn_time_timeout():
	var spawn_index = randi() % spawn_points.size()
	var spawn = spawn_points[spawn_index]
	var arrow = arrowScene.instantiate()
	main.add_child(arrow)
	arrow.arrow_type = spawn_index
	arrow.position = spawn.position
	
	if $SpawnTime.wait_time > MIN_TIME:
		$SpawnTime.wait_time -= 0.1
		arrow.arrow_velocity += 10
	
	arrow.point.connect(make_point)
	arrow.add_to_group("arrows")

func make_point():
	point.emit()
