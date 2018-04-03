extends RigidBody2D

export(int) var speedup = 4
var max_speed = 300


func _physics_process(delta):
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.is_in_group("Bricks"):
			hit_brick(body)

		if body.name == "Paddle":
			hit_paddle(body)

	if get_position().y > get_viewport_rect().end.y:
		queue_free()


func hit_brick(body):
	get_node("/root/World").score += 5
	body.queue_free()
	
func hit_paddle(body):
	var current_speed = get_linear_velocity().length()
	var speed = min(current_speed + speedup, max_speed)
	
	var current_direction = get_position() - body.get_node("Anchor").get_global_position()
	var velocity = current_direction.normalized() * speed
	set_linear_velocity(velocity)