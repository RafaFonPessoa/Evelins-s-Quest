extends CharacterBody2D


const GRAVITY : float = 980.0

@export var speed : float = 300.0
@export var acceleration : float = 30.0
@export var jump_velocity : float = -400.0
@export var on_dialog : bool = false
@export var can_interact : bool = false


#Main
func _physics_process(delta):
	
	if on_dialog:
		$AnimatedSprite2D.play("idle")
		return
	
	player_moviment(delta)
	move_and_slide()

#Player Moviment and Animation
func player_moviment(delta):
	
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y += jump_velocity
	
	var direction = Input.get_axis("left","right")
	
	if direction:
		velocity.x = move_toward(velocity.x, speed * direction , acceleration)
	else:
		velocity.x = move_toward(velocity.x, 0 , acceleration)
	
	animation_controll(direction)

func animation_controll(direction):
	if direction:
		$AnimatedSprite2D.play("run")
		
		if direction < 0:
			$AnimatedSprite2D.flip_h = true
			$PointLight2D/LightOccluder2D.position.x = 10
		else:
			$AnimatedSprite2D.flip_h = false
			$PointLight2D/LightOccluder2D.position.x = 0
		
	else:
		$AnimatedSprite2D.play("idle")
	
	if velocity.y < 0: 
		$AnimatedSprite2D.play("jump")
	elif velocity.y > 0:
		$AnimatedSprite2D.play("fall")


