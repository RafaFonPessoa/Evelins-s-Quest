extends Node2D

const _DIALOG_SCREEN : PackedScene = preload("res://dialog/dialog_screen.tscn")

var lv1Door = false
var lv2Door = false
var lv3Door = false

var _dialog_data : Dictionary = {
	0: {
		"faceset": "res://sprites/faceset/GraceGiver.png",
		"dialog": "Hope Bringer! A esperança está tão alta, que flores estão começando a brotar! Bom trabalho, nunca duvidei de você.",
		"title": "Grace Giver",
	},
	1: {
		"faceset": "res://sprites/faceset/HopeBringer.png",
		"dialog": "(⌐■_■)",
		"title": "Hope Bringer",
	},
	2: {
		"faceset": "res://sprites/faceset/GraceGiver.png",
		"dialog": "Estão vendo jovens Hope Bringers? Vocês serão assim no futuro.",
		"title": "Grace Giver",
	},
	3: {
		"faceset":"res://sprites/faceset/Evelin.png",
		"dialog": "Desculpa em interromper a comemoração... Hope Bringer, chegou o maior desafio! Um planeta todo está em perigo.",
		"title": "Evelin, a Deusa da Esperança",
	},
	4: {
		"faceset": "res://sprites/faceset/HopeBringer.png",
		"dialog": "ヾ( ⁰д⁰)",
		"title": "Hope Bringer",
	},
	5: {
		"faceset": "res://sprites/faceset/Evelin.png",
		"dialog": "Você não escutouu errado. Você terá que para uma guerra que está acontecendo em um planeta.",
		"title": "Evelin, a Deusa da Esperança",
	},
	6: {
		"faceset": "res://sprites/faceset/GraceGiver.png",
		"dialog": "Este é o nosso trabalho, trazer paz e espernaça. Boa Sorte Hope Bringer!",
		"title": "Grace Giver",
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
	
	if lv2Door and Input.is_action_pressed("interact"):
		TransitionScreen._fade_transition()
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://scenes/Rocket/rocket_animation2.tscn")
	
	if lv3Door and Input.is_action_pressed("interact"):
		TransitionScreen._fade_transition()
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://scenes/third_level/battlefiel.gd")


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
	lv2Door = false


func _on_level_3_body_entered(body):
	$Level3.visible = true
	lv3Door = true


func _on_level_3_body_exited(body):
	$Level3.visible = false
	lv3Door = false 
