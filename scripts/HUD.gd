extends CanvasLayer


var score = 0



func _on_tresures_score(value):
	score += value
	$Label.text = "Score: " + str(score)
