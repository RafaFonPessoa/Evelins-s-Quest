extends CharacterBody3D


var speed : float = 3

@export var acceleration : float = 0.1

@onready var animation : AnimatedSprite3D = $AnimatedSprite3D


func _physics_process(delta):
	
	if Input. is_action_pressed("E"):
		rotate_y(0.1)

	var input_dir : Vector2 = Input.get_vector("left", "right", "up", "down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = move_toward(velocity.x, speed * direction.x, acceleration)
		velocity.z = move_toward(velocity.z, speed * direction.z, acceleration)
		print(velocity)
	else:
		velocity.x = move_toward(velocity.x, 0, speed * acceleration)
		velocity.z = move_toward(velocity.z, 0, speed * acceleration)
		
	move_and_slide()
	
	#ANIMATION CONTROLL
	update_facing(input_dir)
	update_animation(facing, input_dir)
	


#ANIMATION CONTROLL
var facing = 0

func update_facing(input_dir):
	
	#North
	if input_dir == Vector2(0,-1):
		facing = 1 
	#East
	if input_dir == Vector2(1,0):
		facing = 2
	#South 
	if input_dir == Vector2(0,1):
		facing =  3
	#West 
	if input_dir == Vector2(-1,0):
		facing = 4
	
	#North East / North West
	if input_dir.x < 0 and input_dir.y < 0 or input_dir.x > 0 and input_dir.y < 0:
		facing = 1
	#South East / South West
	if input_dir.x < 0 and input_dir.y > 0 or input_dir.x > 0 and input_dir.y > 0:
		facing = 3
	print(input_dir)
	
func update_animation(facing,input_dir):
		match facing:
			1:
				if input_dir:
					$AnimatedSprite3D.play("run0")
				else:
					$AnimatedSprite3D.play("idle0")
			2:
				if input_dir:
					$AnimatedSprite3D.play("run1")
				else:
					$AnimatedSprite3D.play("idle1")
			3:
				if input_dir:
					$AnimatedSprite3D.play("run2")
				else:
					$AnimatedSprite3D.play("idle2")
			4:
				if input_dir:
					$AnimatedSprite3D.play("run3")
				else:
					$AnimatedSprite3D.play("idle3")
