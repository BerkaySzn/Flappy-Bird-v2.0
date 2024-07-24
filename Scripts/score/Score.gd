extends Control

var SCORE = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$ScoreTimer.start()
func _on_score_timer_timeout():
	SCORE += 1
	$ScoreLabel.text = str(SCORE)
