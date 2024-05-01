extends CanvasLayer
signal transition_finish

@onready var color_rect = $ColorRect
@onready var animation = $AnimationPlayer

func _ready():
	color_rect = false

func _fade_transition():
	animation.play("fade_to_black")

func _fade_out():
	animation.play_backwards("fade_to_black")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		transition_finish.emit()
		color_rect = false
