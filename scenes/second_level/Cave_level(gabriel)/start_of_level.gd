extends Node2D

const _DIALOG_SCREEN : PackedScene = preload("res://dialog/dialog_screen.tscn")

var _dialog_data1 : Dictionary = {
	0: {
		"faceset": "res://sprites/faceset/DanceCreature.jpeg",
		"dialog": "Olá estranho,bem vindo a cidade da dança",
		"title": "Dance Creature",
	},
	1: {
		"faceset": "res://sprites/faceset/DanceCreature.jpeg",
		"dialog": "A cidade onde todos se comunicam dançando",
		"title": "Dance Creature",
	},
	2: {
		"faceset": "res://sprites/faceset/HopeBringer.png",
		"dialog": "(•⤙•)",
		"title": "Hope Bringer",
	},
	3: {
		"faceset": "res://sprites/faceset/DanceCreature.jpeg",
		"dialog": "ta duvidando?se liga no gingado do pai",
		"title": "Dance Creature",
	},
	4: {
		"faceset": "res://sprites/faceset/HopeBringer.png",
		"dialog": "(૭ ｡•̀ ᵕ •́｡ )૭",
		"title": "Hope Bringer",
	},
}

@export_category("Object")
@export var hud : CanvasLayer = null

# Called when the node enters the scene tree for the first time.
func _ready():
	TransitionScreen._fade_out()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	$Player.position = Vector2(32, -5)


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		var _new_dialog:DialogScreen = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _dialog_data1
		hud.add_child(_new_dialog)
		$Player.on_dialog = true
		
		await _new_dialog.dialog_ended
		
		$Player.on_dialog = false
		$Area2D.queue_free()


func _on_exit_body_entered(area):
	if area.is_in_group("player"):
		TransitionScreen._fade_transition()
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://scenes/second_level/Cave_level(gabriel)/second_scene.tscn")
