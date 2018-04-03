extends CanvasLayer

signal start_game

const BRICK_SCORE = 5
var score = 0 


func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()

func show_game_over():
	update_score(0)
	
	show_message("Game Over")
	yield($MessageTimer, "timeout")
	$StartButton.show()
	$MessageLabel.text = "Breakout"
	$MessageLabel.show()

func update_score(value):
	score = value
	$ScoreLabel.text = "Score: " + str(score)


func _on_StartButton_pressed():
	$StartButton.hide()
	show_message("Get Ready!")
	yield($MessageTimer, "timeout")
	emit_signal("start_game")

func _on_MessageTimer_timeout():
	$MessageLabel.hide()

func _on_Ball_brick_hit():
	update_score(score + BRICK_SCORE)
