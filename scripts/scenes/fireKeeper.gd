extends Area2D

const lines : Array [String] = [
	"Hope Bringer! My light is fadding...",
	"Go, found the hope and help my people!",
	"Bring hope again, bring light!",
]

var in_area = false


func _unhandled_input(event):
	if event.is_action_pressed("interact") and in_area:
		DialogManager.start_dialog(global_position + Vector2(100,0), lines)
	


func _on_body_entered(body):
	in_area = true
	$Label.visible = true


func _on_body_exited(body):
	in_area = false
	$Label.visible = false
