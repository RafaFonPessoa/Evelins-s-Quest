extends Area2D

signal point

var effect = preload("res://scenes/second_level/cave_level/fireSfx.tscn")

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
@onready var fire : AnimatedSprite2D = $AnimatedSprite2D
@onready var arrow_colission : CollisionShape2D = $CollisionShape2D

func _process(delta):
	sprite.texture = arrow_sprite[arrow_type]
	position.y += arrow_velocity * delta
	
	if red_can_interact and Input.is_action_pressed("left"):
		point.emit()
	if green_can_interact and Input.is_action_pressed("up"):
		point.emit()
	if blue_can_interact and Input.is_action_pressed("right"):
		point.emit()
	if yellow_can_interact and Input.is_action_pressed("down"):
		point.emit()



func _on_animated_sprite_2d_animation_finished():
	queue_free()


func _on_point():
	arrow_colission.queue_free()
	arrow_velocity = 0
	sprite.visible = false
	fire.visible = true
	fire.play("fire")
