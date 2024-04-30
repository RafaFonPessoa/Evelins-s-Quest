extends CharacterBody2D


@export var speed : float = 200
@export var acceleration : float = 20

#Identify the direction where the character is facing
var facing : int = 5

#Main
func _physics_process(delta):
	player_moviment()
	move_and_slide()

#Input Controll and Player Moviment
func player_moviment():
	var direction = Input.get_vector("left", "right","up","down").normalized()
	
	if direction:
		velocity.x =  move_toward(velocity.x, speed * direction.x, acceleration)
		velocity.y =  move_toward(velocity.y, speed * direction.y, acceleration)
	else:
		velocity.x = move_toward(velocity.x, 0, acceleration)
		velocity.y = move_toward(velocity.y, 0, acceleration)
	
	facing_update(direction)
	animation_controll(facing,direction)

#Change facing Value
func facing_update(direction):
	#North
	if direction == Vector2(0,-1):
		facing = 1
	#East
	if direction == Vector2(1,0):
		facing = 3
	#South
	if direction == Vector2(0,1):
		facing = 5
	#West
	if direction == Vector2(-1,0):
		facing = 7
	
	#NE
	if direction.x > 0 and direction.y < 0:
		facing = 2
	#SE
	if direction.x > 0 and direction.y > 0:
		facing = 4
	#SW
	if direction.x < 0 and direction.y > 0:
		facing = 6
	#NW
	if direction.x < 0 and direction.y < 0:
		facing = 8

#Change animation base on facing value
func animation_controll(facing,direction):
	match facing:
		1:
			if direction:
				$AnimatedSprite2D.play("walk1")
			else:
				$AnimatedSprite2D.play("idle1")
		2:
			if direction:
				$AnimatedSprite2D.play("walk2")
			else:
				$AnimatedSprite2D.play("idle2")
		3:
			if direction:
				$AnimatedSprite2D.play("walk3")
			else:
				$AnimatedSprite2D.play("idle3")
		4:
			if direction:
				$AnimatedSprite2D.play("walk4")
			else:
				$AnimatedSprite2D.play("idle4")
		5:
			if direction:
				$AnimatedSprite2D.play("walk5")
			else:
				$AnimatedSprite2D.play("idle5")
		6:
			if direction:
				$AnimatedSprite2D.play("walk6")
			else:
				$AnimatedSprite2D.play("idle6")
		7:
			if direction:
				$AnimatedSprite2D.play("walk7")
			else:
				$AnimatedSprite2D.play("idle7")
		8:
			if direction:
				$AnimatedSprite2D.play("walk8")
			else:
				$AnimatedSprite2D.play("idle8")
