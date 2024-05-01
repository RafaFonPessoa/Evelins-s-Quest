extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	TransitionScreen._fade_out()

func _physics_process(delta):
	if $AnimationPlayer.is_playing() == false:
		TransitionScreen._fade_transition()
		await  get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://scenes/farm_level/farm.tscn")

