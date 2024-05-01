extends Node2D
class_name StartCutscene

const _DIALOG_SCREEN : PackedScene = preload("res://dialog/dialog_screen.tscn")


var _dialog_data : Dictionary = {
	0: {
		"faceset": "res://sprites/faceset/Evelin.png",
		"dialog": "Hope Bringer, meu bravo guerreiro! Sonhando mais uma vez que está voando?",
		"title": "Evelin, a Deusa da Esperança",
	},
	1: {
		"faceset": "res://sprites/faceset/HopeBringer.png",
		"dialog": "ヾ( ⁰д⁰)",
		"title": "Hope Bringer",
	},
	2: {
		"faceset": "res://sprites/faceset/Evelin.png",
		"dialog": "Oh! Perdão por invadir seu sonho. Acorde agora, a esperança está se esvaindo.",
		"title": "Evelin, a Deusa da Esperança",
	},
	3: {
		"faceset": "res://sprites/faceset/Evelin.png",
		"dialog": "Estou perdendo minha luz, a maldade está fazendo a espernaça sumir! Venha para a sala do trono agora!",
		"title": "Evelin, a Deusa da Esperança",
	},
	4: {
		"faceset": "res://sprites/faceset/HopeBringer.png",
		"dialog": "(_ _ ) Zzz z",
		"title": "Hope Bringer",
	},
	5: {
		"faceset": "res://sprites/faceset/Evelin.png",
		"dialog": "Dormir mais um pouco? Não temos tempo! Seu mentor irá te chamar, acore logo!",
		"title": "Evelin, a Deusa da Esperança",
	},
}

@export_category("Object")
@export var hud : CanvasLayer = null

func _ready():
	TransitionScreen._fade_out()
	await get_tree().create_timer(1.5).timeout
	
	var _new_dialog : DialogScreen = _DIALOG_SCREEN.instantiate()
	
	
	_new_dialog.data = _dialog_data
	hud.add_child(_new_dialog)
	
	await _new_dialog.dialog_ended
	
	TransitionScreen._fade_transition()
	$Deusa.play()
	await get_tree().create_timer(1).timeout
	
	get_tree().change_scene_to_file("res://scenes/first_level/tutorial.tscn")


