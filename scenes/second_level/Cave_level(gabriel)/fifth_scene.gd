extends Node2D


const _DIALOG_SCREEN : PackedScene = preload("res://dialog/dialog_screen.tscn")

var _dialog_data1 : Dictionary = {
	0: {
		"faceset": "res://sprites/faceset/DanceCreature.jpeg",
		"dialog": "Pai você não vai acreditar, eu finalmente aprendi a dançar e tudo graças a esse rapaz de prata",
		"title": "StumbleFeet",
	},
	1: {
		"faceset": "res://sprites/faceset/HopeBringer.png",
		"dialog": "( • ᴗ - ) ✧",
		"title": "Hope Bringer",
	},
	2: {
		"faceset":"res://sprites/faceset/DanceKing.jpeg" ,
		"dialog": "Obrigado homem de lata, eu sabia que você conseguiria",
		"title": "Dance King",
	},
	3: {
		"faceset":"res://sprites/faceset/DanceKing.jpeg" ,
		"dialog": "Afinal! Quem precisa de palavras quando se tem estilo, não é mesmo?",
		"title": "Dance King",
	},
	4: {
		"faceset": "res://sprites/faceset/HopeBringer.png",
		"dialog": "=^◕⩊◕^=",
		"title": "Hope Bringer",
	},
	5: {
		"faceset":"res://sprites/faceset/DanceKing.jpeg" ,
		"dialog": "Venha filho! Vamos mostrar pra sua mãe a arte do gingado",
		"title": "Dance King",
		},
	6: {
		"faceset": "res://sprites/faceset/HopeBringer.png",
		"dialog": "ヽ(⌐■_■)ノ♪",
		"title": "Hope Bringer",
	},
	
}

@export_category("Object")
@export var hud : CanvasLayer = null

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		var _new_dialog:DialogScreen = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _dialog_data1
		hud.add_child(_new_dialog)
		$Player.on_dialog = true
		
		await _new_dialog.dialog_ended
		
		$Player.on_dialog = false
		$AnimatedSprite2D7.play("dessummon")
		$AnimatedSprite2D3.play("dessummon")
		await get_tree().create_timer(1).timeout
		$AnimatedSprite2D7.visible=false
		$AnimatedSprite2D3.visible=false
		
		await get_tree().create_timer(0.5).timeout
		TransitionScreen._fade_transition()
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://scenes/third_level/clastle3.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	TransitionScreen._fade_out()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



