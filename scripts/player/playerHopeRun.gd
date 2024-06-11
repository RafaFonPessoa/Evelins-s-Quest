extends CharacterBody2D


const GRAVITY : int = 4200
const JUMP_SPEED : int = -1700

@export var start_game = false

@onready var jump : AudioStreamPlayer2D = $Jump
@onready var animation : AnimatedSprite2D = $AnimatedSprite2D
@onready var RunCol : CollisionShape2D = $RunCol


func _physics_process(delta):
	velocity.y += GRAVITY * delta
	
	
	if is_on_floor():
		RunCol.disabled = false
		if Input.is_action_pressed("up"):
			velocity.y = JUMP_SPEED
			animation.play("jump")
			jump.play()
		elif Input.is_action_pressed("down"):
			animation.play("dunk")
			RunCol.disabled = true
		else:
			animation.play("run")
		
	move_and_slide()
