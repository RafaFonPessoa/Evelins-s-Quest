extends Node2D


signal Score 



func _on_treasure_3_score(value):
	Score.emit(value)

func _on_treasure_2_score(value):
	Score.emit(value)

func _on_treasure_score(value):
	Score.emit(value)
