extends Node2D

const _DIALOG_SCREEN : PackedScene = preload("res://dialog/dialog_screen.tscn")


var _dialog_data1 : Dictionary = {
	0: {
		"faceset": "res://sprites/faceset/Erika.png",
		"dialog": "Não posso acredita! Alguem realmente consegui passa pela floresta! O que? Essa carroça? Está falando sério?",
		"title": "Erika Faust",
	},
	1: {
		"faceset": "res://sprites/faceset/HopeBringer.png",
		"dialog": "('-')b",
		"title": "Hope Bringer",
	},
	2: {
		"faceset": "res://sprites/faceset/Erika.png",
		"dialog": "Obrigada! Finalmente poderemos comer um pouco e usar as ferramentas para poder cutivar nossos alimentos! Fale com o lider da vila.",
		"title": "Claudio Anedot",
	},
}

var _dialog_data2 : Dictionary = {
	0: {
		"faceset": "res://sprites/faceset/Fasam.png",
		"dialog": "Por isso escurei os moradores agitados... Você realmente consegiu? Impressionante! Ninguem nunca tinha conseguido!",
		"title": "Fasam",
	},
	1: {
		"faceset": "res://sprites/faceset/Fasam.png",
		"dialog": "Bem, só temos a agradecer, já estavamos ficando sem esperança. Agora, podemos plantar nossos aliemntos. Você nos salvou",
		"title": "Fasam",
	},
	2: {
		"faceset": "res://sprites/faceset/Fasam.png",
		"dialog": "Como assim não agradecer a você?... Um fazendeiro chamado Claduio? Bem, de qualquer forma, agradeço a vocês! Vou escrever uma carta de agradecimento.",
		"title": "Fasam",
	},
}

@export_category("Object")
@export var hud : CanvasLayer = null


# Called when the node enters the scene tree for the first time.
func _ready():
	TransitionScreen._fade_out()
	
	await get_tree().create_timer(1).timeout
	
	var _new_dialog1 : DialogScreen = _DIALOG_SCREEN.instantiate()
	
	$Player.on_dialog = true
	
	_new_dialog1.data = _dialog_data1
	hud.add_child(_new_dialog1)
	
	await _new_dialog1.dialog_ended
	$Player.on_dialog = false





func _on_dialog_1_body_entered(body):
	if body.is_in_group("player"):
		var _new_dialog2 : DialogScreen = _DIALOG_SCREEN.instantiate()
		$Player.on_dialog = true
		
		_new_dialog2.data = _dialog_data2
		hud.add_child(_new_dialog2)
		
		await _new_dialog2.dialog_ended
		TransitionScreen._fade_transition()
		await get_tree().create_timer(1).timeout
		$Player.on_dialog = false
		get_tree().change_scene_to_file("res://scenes/second_level/clastle2.tscn")
