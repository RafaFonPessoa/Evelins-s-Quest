extends Node2D

var points = 0

@onready var points_label = $Points
@onready var bar_level = $Bar

func _on_arrow_spawner_point():
	points += 2
	points_label.text = "Nivel de Felicidade: " + str(points) + "%"

func _physics_process(delta):
	#Won Game
	if points >= 100:
		$ArrowSpawner/SpawnTime.stop()
		var arrows = get_tree().get_nodes_in_group("arrows")
		for i in arrows:
			i.queue_free()
	elif points < 0: #Fail Game
		$ArrowSpawner/SpawnTime.stop()
		var arrows = get_tree().get_nodes_in_group("arrows")
		for i in arrows:
			i.queue_free()
	
	match points: 
		10:
			bar_level.frame = 1
		20:
			bar_level.frame = 2
		30:
			bar_level.frame = 3
		40:
			bar_level.frame = 4
		50:
			bar_level.frame = 5
		60:
			bar_level.frame = 6
		70:
			bar_level.frame = 7
		80:
			bar_level.frame = 8
		90:
			bar_level.frame = 9
		100:
			bar_level.frame = 10


func _on_arrow_exit_area_entered(area):
	$ArrowExit/AudioStreamPlayer2D.play()
	points -= 10
	points_label.text = "Nivel de Felicidade: " + str(points) + "%"
	area.queue_free()
