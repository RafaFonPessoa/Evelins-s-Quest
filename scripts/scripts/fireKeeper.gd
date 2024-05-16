extends Area2D

const lines : Array [String] = [
	"Hope Bringer! My light is fadding...",
	"Go, found the hope and help my people!",
	"Bring hope again, bring light!",
]

var in_area = false




func _on_body_entered(body):
	in_area = true
	$Label.visible = true


func _on_body_exited(body):
	in_area = false
	$Label.visible = false
