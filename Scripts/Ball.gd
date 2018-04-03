extends RigidBody2D

const SPEEDUP = 4
const MAX_SPEED = 300


func _physics_process(delta):
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("Bricks"):
			body.queue_free()
			
		if body.name == "Paddle":
			var current_speed = get_linear_velocity().length()
			var speed = min(current_speed + SPEEDUP, MAX_SPEED)
			
			var current_direction = get_position() - body.get_node("Anchor").get_global_position()
			var velocity = current_direction.normalized() * speed
			set_linear_velocity(velocity)
			
	if get_position().y > get_viewport_rect().end.y:
		print("Ball died")
		queue_free()
