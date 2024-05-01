extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	TransitionScreen._fade_out()



func _on_visible_on_screen_notifier_2d_screen_exited():
	$Player/Death.play()
	$Player.position = Vector2.ZERO


func _on_exit_body_entered(body):
	if body.is_in_group("player"):
		TransitionScreen._fade_transition()
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://scenes/farm_level/farm_house.tscn")
