extends Node2D


const _DIALOG_SCREEN : PackedScene = preload("res://dialog/dialog_screen.tscn")

var _dialog_data1 : Dictionary = {
	0: {
		"faceset": "res://sprites/faceset/DanceKing.jpeg",
		"dialog": "Olá estranho,sou o rei da dança, o ser mais dançante entre todas as criaturas dançantes e chefe desse
		pequeno vilarejo",
		"title": "Dance King",
	},
	1: {
		"faceset": "res://sprites/faceset/DanceKing.jpeg",
		"dialog": "Preciso de sua ajuda meu filho esta sofrendo, ele não tem o gingado do pai e passa os dias a se lamentar
		por não saber como rebolar",
		"title": "Dance King",
	},
	2: {
		"faceset": "res://sprites/faceset/HopeBringer.png",
		"dialog": "( ͡° ͜ʖ ͡°)",
		"title": "Hope Bringer",
	},
	3: {
		"faceset":"res://sprites/faceset/DanceKing.jpeg" ,
		"dialog": "Por favor homem de lata,ensine meu filho a dominar a arte do passinho",
		"title": "Dance King",
	},
	4: {
		"faceset": "res://sprites/faceset/HopeBringer.png",
		"dialog": "(っ ͡ ͡º - ͡ ͡º ς)",
		"title": "Hope Bringer",
	},
	5: {
		"faceset": "res://sprites/faceset/DanceKing.jpeg",
		"dialog": "por que eu não o ensino? porque estou sempre muito ocupado cuidando da vila e os outros tem medo
		de meu filho por ele ser diferente,eles o evitam",
		"title": "Dance King",
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
		
		$AnimatedSprite2D3.visible=true
		$AnimatedSprite2D3.play("summon")
		await get_tree().create_timer(1).timeout
		$AnimatedSprite2D3.play("new_animation")
		
		await _new_dialog.dialog_ended
		
		$Player.on_dialog = false
		$Area2D.queue_free()


# Called when the node enters the scene tree for the first time.
func _ready():
	TransitionScreen._fade_out()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_visible_on_screen_notifier_2d_screen_exited():
	$Player.position = Vector2(32, -5)

func _on_exit_body_entered(area):
	if area.is_in_group("player"):
		TransitionScreen._fade_transition()
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://scenes/second_level/Cave_level(gabriel)/third_scene.tscn")
