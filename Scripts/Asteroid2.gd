
extends RigidBody2D

var hitpoints = 2

func _ready():
	set_process(true)
	pass

func _process(delta):
	check_life()
	pass

func set_damage(val):
	hitpoints -= val
	print(hitpoints)
	
func check_life():
	if hitpoints <= 0:
		queue_free()
		Points.add_points(5)