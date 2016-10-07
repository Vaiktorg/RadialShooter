
extends Control

onready var pointlabel = get_node("Points")
onready var timerlabel = get_node("TimerText")
onready var timer = get_node("Timer")
var seconds = 0

func _on_Timer_timeout():
	seconds += 1
	timerlabel.set_text(str(seconds))
	timer.start()
	pass # replace with function body

