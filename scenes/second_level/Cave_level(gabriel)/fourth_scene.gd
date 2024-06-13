extends Node2D


const _DIALOG_SCREEN : PackedScene = preload("res://dialog/dialog_screen.tscn")

var _dialog_data1 : Dictionary = {
	0: {
		"faceset": "res://sprites/faceset/DanceCreature.jpeg",
		"dialog": "Ugh! Eu odeio isso! Odeio esse lugar! Odeio dançar! Por que eu sou o único que não consegue?",
		"title": "StumbleFeet",
	},
	1: {
		"faceset": "res://sprites/faceset/HopeBringer.png",
		"dialog": "👏",
		"title": "Hope Bringer",
	},
	2: {
		"faceset": "res://sprites/faceset/DanceCreature.jpeg",
		"dialog": "O que você quer? Vai me dizer que eu preciso dançar também? Vai rir de mim como todos os outros?",
		"title": "StumbleFeet",
	},
	3: {
		"faceset": "res://sprites/faceset/HopeBringer.png",
		"dialog": "～(■_■)～♪👉",
		"title": "Hope Bringer",
	},
	4: {
		"faceset": "res://sprites/faceset/DanceCreature.jpeg",
		"dialog": "Você acha que pode me ensinar a arte do gingado? Logo eu que não tenho nem rebolado.",
		"title": "StumbleFeet",
	},
	5: {
		"faceset": "res://sprites/faceset/HopeBringer.png",
		"dialog": "🥺👉👈",
		"title": "Hope Bringer",
		},
	6: {
		"faceset": "res://sprites/faceset/DanceCreature.jpeg",
		"dialog": "Tá bom, tá bom. Mostra aí, eu vou tentar.",
		"title": "StumbleFeet",
		},
}

@export_category("Object")
@export var hud : CanvasLayer = null

# Called when the node enters the scene tree for the first time.
func _ready():
	TransitionScreen._fade_out()


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		var _new_dialog:DialogScreen = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _dialog_data1
		hud.add_child(_new_dialog)
		$Player.on_dialog = true
		
		await _new_dialog.dialog_ended
		
		$Player.on_dialog = false
		if body.is_in_group("player"):
			TransitionScreen._fade_transition()
			await get_tree().create_timer(1).timeout
			get_tree().change_scene_to_file("res://scenes/second_level/cave_level/dance_game1.tscn")




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_visible_on_screen_notifier_2d_screen_exited():
	$Player.position = Vector2(32, -5)

