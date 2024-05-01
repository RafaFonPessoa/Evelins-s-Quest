extends Node

const _DIALOG_SCREEN : PackedScene = preload("res://dialog/dialog_screen.tscn")


var _dialog_data1 : Dictionary = {
	0: {
		"faceset": "res://sprites/faceset/Claudio.png",
		"dialog": "Oxi, quem é você meu filho?... Ah, então foi você que eu vi descer do céu, achava que era uma estrela cadente! Você veio de um castelo no ceu?",
		"title": "Claudio Anedot",
	},
	1: {
		"faceset": "res://sprites/faceset/HopeBringer.png",
		"dialog": "(o^-’)b",
		"title": "Hope Bringer",
	},
	2: {
		"faceset": "res://sprites/faceset/Claudio.png",
		"dialog": "Me ajudar? Sim! Preciso de ajuda meu jovem, você tem que ajudar um velho que já não pode mais andar direito.",
		"title": "Claudio Anedot",
	},
	3: {
		"faceset": "res://sprites/faceset/Claudio.png",
		"dialog": "Existe uma vila cercada por uma floresta magica, essa vila não tem ferramentas para plantar e nem tem comida direito para sobreviver!",
		"title": "Grace Giver",
	},
	4: {
		"faceset": "res://sprites/faceset/Claudio.png",
		"dialog": "A anos tento ir para essa vila, apenas consigo observar a vila com minha luneta quando subo no celeiro. Eles não conseguem sair da vila.",
		"title": "Claudio Anedot",
	},
	5: {
		"faceset": "res://sprites/faceset/Claudio.png",
		"dialog": "Como falei, a floresta é magica, se você errar o caminho, você volta para o inicio da trilha. A trilha é magica e muda seu caminho, nem bussula pode ajudar!",
		"title": "Claudio Anedot",
	},
	6: {
		"faceset": "res://sprites/faceset/HopeBringer.png",
		"dialog": "( ºΔº )",
		"title": "Hope Bringer",
	},
	7: {
		"faceset": "res://sprites/faceset/Claudio.png",
		"dialog": "Leve essas ferramentas e comida para o povo da vila *Claudio aponta para uma carroça*. Que você seja abençõado na sua viagem!",
		"title": "Claudio Anedot",
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


func _on_exit_body_entered(body):
	if body.is_in_group("player"):
		TransitionScreen._fade_transition()
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://scenes/farm_level/simon.tscn")
