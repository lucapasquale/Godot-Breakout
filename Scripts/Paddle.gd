extends KinematicBody2D

const BALL_SCENE = preload("res://Scenes/Ball.tscn")


func _physics_process(delta):
	var mouse_x = get_viewport().get_mouse_position().x
	set_position(Vector2(mouse_x, 320))
	
func _input(event):
	if event is InputEventMouseButton && event.is_pressed():
		var ball = BALL_SCENE.instance()
		ball.set_position(get_position() - Vector2(0, 16))
		get_tree().get_root().add_child(ball)