extends Node2D

const _DIALOG_SCREEN : PackedScene = preload("res://dialog/dialog_screen.tscn")


var _dialog_data1 : Dictionary = {
	0: {
		"faceset": "res://sprites/faceset/Andrei.png",
		"dialog": "Ei! Não se aproxime! Eu não concordo com esta guerra! Eu sei como para ela!",
		"title": "Principe Andrei",
	},
	1: {
		"faceset": "res://sprites/faceset/Nabor.png",
		"dialog": "Mesmo ferido eu poderia lutar junto com você Andrei! Não somos desertores.",
		"title": "Principe Nabor",
	},
	2: {
		"faceset": "res://sprites/faceset/HopeBringer.png",
		"dialog": "b(~ _^)d",
		"title": "Hope Bringer",
	},
	3: {
		"faceset": "res://sprites/faceset/Andrei.png",
		"dialog": "Você veio para a guerra? Você tem que levar isso! *Andrei entrega uma pedra pesada*",
		"title": "Principe Andrei",
	},
	4: {
		"faceset": "res://sprites/faceset/Nabor.png",
		"dialog": "Oque impedia a guerra era uma estatua que representava a amizade entre os reinos.",
		"title": "Principe Nabor",
	},
	5: {
		"faceset": "res://sprites/faceset/Andrei.png",
		"dialog": "Nossos pais achavam que alguem tinha mirado uma catapulta e destruido a estatua, mas na verdade, foi um meteoro que caiu! Corra até o castelo para avisar a eles e parar a guerra!",
		"title": "Principe Andrei",
	},
	6: {
		"faceset": "res://sprites/faceset/HopeBringer.png",
		"dialog": "( ºΔº )",
		"title": "Hope Bringer",
	},
	7: {
		"faceset": "res://sprites/faceset/Nabor.png",
		"dialog": "O principe Andrei é meu amigo e não quer me abandornar e eu estou ferido para passar pelo campo de batalha e as ruines atrairam monstros, cuidado gurreiro!",
		"title": "Principe Nabor",
	}
}



@export_category("Object")
@export var hud : CanvasLayer = null

# Called when the node enters the scene tree for the first time.
func _ready():
	TransitionScreen._fade_out()


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		TransitionScreen._fade_transition()
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://scenes/third_level/HopeRunner/main.tscn")


func _on_area_2d_2_body_entered(body):
	var _new_dialog1 : DialogScreen = _DIALOG_SCREEN.instantiate()
	
	$Player.on_dialog = true
	
	_new_dialog1.data = _dialog_data1
	hud.add_child(_new_dialog1)
	
	await _new_dialog1.dialog_ended
	$Player.on_dialog = false
