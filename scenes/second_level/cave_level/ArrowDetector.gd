extends Node2D

func _on_red_area_entered(area):
	area.red_can_interact = true

func _on_green_area_entered(area):
	area.green_can_interact = true

func _on_blue_area_entered(area):
	area.blue_can_interact = true

func _on_yellow_area_entered(area):
	area.yellow_can_interact = true

#------------ Exit ------------------
func _on_red_area_exited(area):
	area.red_can_interact = false

func _on_green_area_exited(area):
	area.green_can_interact = false

func _on_blue_area_exited(area):
	area.blue_can_interact = false

func _on_yellow_area_exited(area):
	area.yellow_can_interact = false
