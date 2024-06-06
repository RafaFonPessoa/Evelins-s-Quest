extends Node2D

var points = 0

@onready var points_label = $Points
@onready var bar_level = $Bar
@onready var dance_keeper = $DanceKeeper
@onready var GameOver = $GameOver
func _on_arrow_spawner_point():
	points += 2
	points_label.text = "Nivel de Felicidade: " + str(points) + "%"

func _ready():
	TransitionScreen.hide()
	new_game()

func _physics_process(delta):
	
	if points < 25:
		dance_keeper.play("Idle")
		dance_keeper.speed_scale = 0.5
	elif points > 25 and points < 50:
		dance_keeper.play("Idle")
		dance_keeper.speed_scale = 1
	elif points > 50 and points < 75:
		dance_keeper.play("Dance")
		dance_keeper.speed_scale = 1
	elif points > 75 :
		dance_keeper.play("Dance2")
		dance_keeper.speed_scale = 1
	
	
	#Won Game
	if points >= 100:
		$ArrowSpawner/SpawnTime.stop()
		var arrows = get_tree().get_nodes_in_group("arrows")
		for i in arrows:
			i.queue_free()
	elif points < 0: #Fail Game
		$ArrowSpawner/SpawnTime.stop()
		GameOver.visible = true
		dance_keeper.visible = false
		points_label.visible = false
		bar_level.visible = false
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

func new_game():
	GameOver.visible = false
	dance_keeper.visible = true
	points_label.visible = true
	bar_level.visible = true
	points = 0
	points_label.text = "Nivel de Felicidade: " + str(points) + "%"
	$ArrowSpawner/SpawnTime.start()

func _on_arrow_exit_area_entered(area):
	$ArrowExit/AudioStreamPlayer2D.play()
	points -= 10
	points_label.text = "Nivel de Felicidade: " + str(points) + "%"
	area.queue_free()



func _on_button_pressed():
	new_game()
