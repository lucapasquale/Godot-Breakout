extends RigidBody2D

signal brick_hit
signal game_over

export(int) var speedup = 40
const MAX_SPEED = 500


func _on_Visibility_viewport_exited(viewport):
	emit_signal("game_over")
	queue_free()

func _on_Ball_body_entered(body):
	if body.is_in_group("Bricks"):
		emit_signal("brick_hit")
		body.queue_free()

	if body.name == "Paddle":
		_hit_paddle(body)

func _hit_paddle(body):
	var current_speed = get_linear_velocity().length()
	var speed = min(current_speed + speedup, MAX_SPEED)

	var current_direction = get_position() - body.get_node("Anchor").get_global_position()
	var velocity = current_direction.normalized() * speed
	set_linear_velocity(velocity)
