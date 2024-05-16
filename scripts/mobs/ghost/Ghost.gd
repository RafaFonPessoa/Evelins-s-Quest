extends CharacterBody2D


var speed = 100
var acceleration = 10

var chase_player = false
var player = null

func _physics_process(delta):
	animation_controll()
	if chase_player:
		var direction = (player.position - position).normalized()
		velocity.x = move_toward(velocity.x, direction.x * speed, acceleration)
		velocity.y = move_toward(velocity.y, direction.y * speed, acceleration)
	else :
		velocity.x = move_toward(velocity.x, 0, acceleration)
		velocity.y = move_toward(velocity.y, 0, acceleration)
		
	move_and_slide()

func animation_controll():
	if chase_player:
		$AnimatedSprite2D.play("attack")
	else :
		$AnimatedSprite2D.play("idle2")

func _on_detection_area_body_entered(body):
	if body.is_in_group("player"):
		player = body
		chase_player = true


func _on_detection_area_body_exited(body):
	if body.is_in_group("player"):
		player = null
		chase_player = false
