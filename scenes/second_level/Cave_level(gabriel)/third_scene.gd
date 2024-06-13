extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	TransitionScreen._fade_out()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_visible_on_screen_notifier_2d_screen_exited():
	$Player.position = Vector2(32, -5)

func _on_exit_body_entered(area):
	if area.is_in_group("player"):
		TransitionScreen._fade_transition()
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://scenes/second_level/Cave_level(gabriel)/fourth_scene.tscn")
