extends CharacterBody2D

var speed = 100
var acceleration = 10

var chase_player = false
var player = null

@onready var ray = $Detection_Area/CollisionShape2D/RayCast2D
@onready var light = $PointLight2D

func _physics_process(delta):
	
	#Enemy moviment
	if chase_player:
		var direction = (player.position - position).normalized()
		velocity.x = move_toward(velocity.x, direction.x * speed, acceleration)
		velocity.y = move_toward(velocity.y, direction.y * speed, acceleration)
		
		if direction.x < 0:
			$AnimatedSprite2D.flip_h = true
		else :
			$AnimatedSprite2D.flip_h = false
	else :
		velocity.x = move_toward(velocity.x, 0, acceleration)
		velocity.y = move_toward(velocity.y, 0, acceleration)
	
	animation_controlldire()
	enemy_vision()
	move_and_slide()

func enemy_vision():
	if ray:
		if player:
			ray.target_position = to_local(player.position)
			var space_state = get_world_2d().direct_space_state
			var query = PhysicsRayQueryParameters2D.create(global_position, player.position)
			query.exclude = [self]
			
			var result = space_state.intersect_ray(query)
			
			if result.is_empty():
				chase_player = true

func animation_controlldire():
	if chase_player:
		$AnimatedSprite2D.play("attack")
	else :
		$AnimatedSprite2D.play("idle2")

func _on_detection_area_body_entered(body):
	if body.is_in_group("player"):
		player = body


func _on_detection_area_body_exited(body):
	if body.is_in_group("player"):
		player = null
		chase_player = false
