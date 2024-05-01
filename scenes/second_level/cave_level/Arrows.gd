extends Area2D

signal point

var red = preload("res://scenes/farm_level/redArrow.png")
var green = preload("res://scenes/farm_level/greenArrow.png")
var blue = preload("res://scenes/farm_level/blueArrow.png")
var yellow = preload("res://scenes/farm_level/yellowArrow.png")

@export var red_can_interact : bool = false
@export var green_can_interact : bool = false
@export var blue_can_interact : bool = false
@export var yellow_can_interact : bool = false

@export var arrow_type : int 

@export var arrow_velocity : float = 500.0

var arrow_sprite = [red,green,blue,yellow] 

@onready var sprite : Sprite2D = $Sprite2D

func _process(delta):
	sprite.texture = arrow_sprite[arrow_type]
	position.y += arrow_velocity * delta
	
	if red_can_interact and Input.is_action_pressed("left"):
		point.emit()
		queue_free()
	if green_can_interact and Input.is_action_pressed("up"):
		point.emit()
		queue_free()
	if blue_can_interact and Input.is_action_pressed("right"):
		point.emit()
		queue_free()
	if yellow_can_interact and Input.is_action_pressed("down"):
		point.emit()
		queue_free()

