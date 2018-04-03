extends Node

export (PackedScene) var ball_scene

func _on_HUD_start_game():
	var ball = ball_scene.instance()
	ball.connect("brick_hit", $HUD, "_on_Ball_brick_hit")
	ball.connect("game_over", self, "_on_Ball_game_over")
	
	ball.set_position($StartPosition.get_position())
	get_tree().get_root().add_child(ball)

func _on_Ball_game_over():
	$HUD.show_game_over()
