extends Node2D

const _DIALOG_SCREEN : PackedScene = preload("res://dialog/dialog_screen.tscn")

var lv1Door = false
var lv2Door = false

var _dialog_data : Dictionary = {
	0: {
		"faceset": "res://sprites/faceset/GraceGiver.png",
		"dialog": "Hope Bringer! Estava comentando com a deusa Evelin sobre o castelo, está bem mais iluminado!",
		"title": "Grace Giver",
	},
	1: {
		"faceset": "res://sprites/faceset/Evelin.png",
		"dialog": "Eu te observei bravo gurreiro, você se saiu muito bem. O fazendeiro ficou muito feliz com a carta, por poder ter ajudado aquele povo.",
		"title": "Evelin, a Deusa da Esperança",
	},
	2: {
		"faceset": "res://sprites/faceset/Evelin.png",
		"dialog": "A Esperança está voltando, por isso o castelo está voltando a ficar energizado, mas ainda sinto uma perturbação. Vamos passar proximo a um planeta que precisa de ajuda",
		"title": "Evelin, a Deusa da Esperança",
	},
	3: {
		"faceset": "res://sprites/faceset/GraceGiver.png",
		"dialog": "Esse plaeta é cheio de cavernas, dentro dessas cavernas existe um povos inteligentes.",
		"title": "Grace Giver",
	},
	4: {
		"faceset": "res://sprites/faceset/Evelin.png",
		"dialog": "Eles se chaman cavernicolas, mas estou sentido uma tristeza enorme vinda de uma só pessoa. Vá Hope Bringer, ajude essa pessoa.",
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
		get_tree().change_scene_to_file("res://scenes/farm_level/farm.tscn")
	
	if lv2Door and Input.is_action_pressed("interact"):
		TransitionScreen._fade_transition()
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://scenes/second_level/Cave_level(gabriel)/start_of_level.tscn")

func _on_level_1_body_entered(body):
	$Level1.visible = true
	lv1Door = true

func _on_level_1_body_exited(body):
	$Level1.visible = false
	lv1Door = false

func _on_level_2_body_entered(body):
	$Level2.visible = true
	lv2Door = true

func _on_level_2_body_exited(body):
	$Level2.visible = false
	lv2Door = true
