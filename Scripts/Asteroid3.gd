
extends KinematicBody2D
export(float) var speed = 200
var direction = Vector2()


var hitpoints = 1

func _ready():
	set_process(true)
	pass

func _process(delta):
	check_life()
	movement(delta)
	pass

func set_damage(val):
	hitpoints -= val
	print(hitpoints)

func check_life():
	if hitpoints <= 0:
		queue_free()
		Points.add_points(5)

func movement(delta):
	direction = (NodeData.Positions.CorePos - self.get_pos()).normalized()
	var motion = direction * speed * delta
	move(motion)