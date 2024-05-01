extends Node2D
class_name tutorial 

const _DIALOG_SCREEN : PackedScene = preload("res://dialog/dialog_screen.tscn")


var _dialog_data1 : Dictionary = {
	0: {
		"faceset": "res://sprites/faceset/GraceGiver.png",
		"dialog": "Hope Bringer! Acordou bem na hora, você precisa ajudar os reinos. Você precisa ver a princesa! O castelo está sombrio!",
		"title": "Grace Giver",
	},
	1: {
		"faceset": "res://sprites/faceset/HopeBringer.png",
		"dialog": "(ㆆ_ㆆ)",
		"title": "Hope Bringer",
	},
	2: {
		"faceset": "res://sprites/faceset/GraceGiver.png",
		"dialog": "Você? Fora de forma? Pare de besteira, me lembro quando eu era um jovem Hope Bringer como você, eu corria por horas sem me cansar.",
		"title": "Grace Giver",
	},
	3: {
		"faceset": "res://sprites/faceset/GraceGiver.png",
		"dialog": "Vamos começar com você alongando essas pernas! Para andar use as setas do teclado!",
		"title": "Grace Giver",
	},
	4: {
		"faceset": "res://sprites/faceset/HopeBringer.png",
		"dialog": "(╥﹏╥)",
		"title": "Hope Bringer",
	},
}

var _dialog_data2 : Dictionary = {
	0: {
		"faceset": "res://sprites/faceset/GraceGiver.png",
		"dialog": "Já cansou?",
		"title": "Grace Giver",
	},
	1: {
		"faceset": "res://sprites/faceset/HopeBringer.png",
		"dialog": "ᕙ(`▿´)ᕗ",
		"title": "Hope Bringer",
	},
	2: {
		"faceset": "res://sprites/faceset/GraceGiver.png",
		"dialog": "Ok, agora você está dizendo que é o durão? Esses jovens...",
		"title": "Grace Giver",
	},
	3: {
		"faceset": "res://sprites/faceset/GraceGiver.png",
		"dialog": "Quando a esperança do reino está baixa, o reino começa a ficar sombrio e a desmoronar! O corredor a frente caiu.",
		"title": "Grace Giver",
	},
	4: {
		"faceset": "res://sprites/faceset/GraceGiver.png",
		"dialog": "Use a seta para cima e você poderá pular! Tome cuidado para não cair.",
		"title": "Grace Giver",
	},
	5: {
		"faceset": "res://sprites/faceset/HopeBringer.png",
		"dialog": "(◡̀_◡́)ᕤ",
		"title": "Hope Bringer",
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
	$GraceGiver1/AudioStreamPlayer2D.play()
	$"GraceGiver1/AnimatedSprite2D".play("gravity")



func _on_animated_sprite_2d_animation_finished():
	$GraceGiver1.queue_free()


func _on_grace_giver_2_body_entered(body):
	if body.is_in_group("player"):
		var _new_dialog2 : DialogScreen = _DIALOG_SCREEN.instantiate()
		$Player.on_dialog = true
		_new_dialog2.data = _dialog_data2
		hud.add_child(_new_dialog2)
		await _new_dialog2.dialog_ended
		$Player.on_dialog = false
		$GraceGiver2/AudioStreamPlayer2D.play()
		$"GraceGiver2/AnimatedSprite2D2".play("gravity")


func _on_animated_sprite_2d_2_animation_finished():
	$"GraceGiver2".queue_free()


func _on_exit_body_entered(body):
	if body.is_in_group("player"):
		TransitionScreen._fade_transition()
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://scenes/first_level/clastle.tscn")
