extends Node2D

var points = 0
var wave = 1
var metadata = {}

func _ready():
	points = 0
	wave = 1
	pass
	
func _process():
	pass
	
func add_points(val):
	points += val
	pass