extends Node2D

const _DIALOG_SCREEN : PackedScene = preload("res://dialog/dialog_screen.tscn")

var lv1Door = false


var _dialog_data : Dictionary = {
	0: {
		"faceset": "res://sprites/faceset/Evelin.png",
		"dialog": "Hope Bringer! Traga a esperança novamente! Iremos passar proximo a um planeta que precisa de ajuda.",
		"title": "Evelin, a Deusa da Esperança",
	},
	1: {
		"faceset": "res://sprites/faceset/Evelin.png",
		"dialog": "Pegue seu foguete e ajude um senhor que mora sozinho em uma parte do planeta. Eu sinto a aflição do pobre senhor.",
		"title": "Evelin, a Deusa da Esperança",
	},
	2: {
		"faceset": "res://sprites/faceset/Evelin.png",
		"dialog": "Boa sorte bravo gurreiro! Seja aquele que traz a luz!",
		"title": "Evelin, a Deusa da Esperança",
	},
}

@export_category("Object")
@export var hud : CanvasLayer = null

func _ready():
	TransitionScreen._fade_out()
	
	var _new_dialog : DialogScreen = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_data
	hud.add_child(_new_dialog)
	
	$Player.on_dialog = true
	
	await _new_dialog.dialog_ended
	
	$Player.on_dialog = false

func _physics_process(delta):
	if lv1Door and Input.is_action_pressed("interact"):
		TransitionScreen._fade_transition()
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://scenes/Rocket/rocket_animation.tscn")
	

func _on_level_1_body_entered(body):
	$Level1.visible = true
	lv1Door = true

func _on_level_1_body_exited(body):
	$Level1.visible = false
	lv1Door = false

