extends CharacterBody2D


const ACELLERATION : float = 20.0
const SPEED : float = 120.0
const JUMP_VELOCITY : float = -300.0
const GRAVITY = 900

@export var on_dialog : bool = false

@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var jump_audio : AudioStreamPlayer2D = $Jump
@onready var walk_effect : AudioStreamPlayer2D = $Walk

func _physics_process(delta):
	player_moviment(delta)
	move_and_slide()

func player_moviment(delta):
	
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	
	if on_dialog:
		velocity.x = 0
		sprite.play("idle")
		walk_effect.stop()
		return
	
	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$Jump.play()
	
	
	var direction = Input.get_axis("left", "right")
	
	if velocity.length() != 0 and is_on_floor(): 
		if !walk_effect.playing:
			walk_effect.pitch_scale = randf_range(.8, 1.2)
			walk_effect.play()
	else:
		walk_effect.stop()
	
	if direction:
		velocity.x = move_toward(velocity.x,direction * SPEED, ACELLERATION)
	else:
		velocity.x = move_toward(velocity.x, 0, ACELLERATION)
	
	animation_controll(direction)
	move_and_slide()

func animation_controll(direction):
	if direction:
		sprite.play("run")
		
		if direction > 0:
			sprite.flip_h = false
		else:
			sprite.flip_h = true
	
	elif not direction and is_on_floor():
		sprite.play("idle")
	
	if not is_on_floor() and velocity.y > 0:
		sprite.play("fall")
	
	if not is_on_floor() and velocity.y < 0:
		sprite.play("jump")
