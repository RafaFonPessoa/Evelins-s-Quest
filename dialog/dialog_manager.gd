extends Node

@onready var text_box_scene = preload("res://scenes/text_box.tscn")

var dialog_line: Array[String] = []

var current_line_index = 0
var text_box
var text_box_position : Vector2

var is_dialog_active = false
var can_advance_line = false 

func start_dialog(position:Vector2, lines: Array[String]):
	print("teste")
	if is_dialog_active:
		return
	
	dialog_line = lines
	text_box_position = position
	_show_text_box()
	
	is_dialog_active = true

func _show_text_box():
	text_box = text_box_scene.instantiate()
	text_box.finish_display.connect(_on_text_box_finish_display)
	get_tree().root.add_child(text_box)
	text_box.global_position = text_box_position
	text_box.display_text(dialog_line[current_line_index])
	can_advance_line = false

func _on_text_box_finish_display():
	can_advance_line = true

func _unhandled_input(event):
	
	if (
		event.is_action_pressed("interact") && is_dialog_active && can_advance_line 
	):
		text_box.queue_free()
		
		current_line_index += 1
		if current_line_index >= dialog_line.size():
			is_dialog_active = false
			current_line_index = 0 
			return
		
		_show_text_box()
