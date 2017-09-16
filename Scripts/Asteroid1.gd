
extends KinematicBody2D

var hitpoints = 1
export(float) var speed = 200
var direction = Vector2()



func _ready():
	set_process(true)
	pass

func _process(delta):
	check_life()
	movement(delta)
	damage_inflict()
	pass

func set_damage(val):
	hitpoints -= val


func check_life():
	if hitpoints <= 0:
		Sound.play("Asteroid")
		explode()
		queue_free()
		Points.add_points(1)

func movement(delta):
	direction = (NodeData.Data.CorePos - self.get_pos()).normalized()
	var motion = direction * speed * delta
	move(motion)
	
func damage_inflict():
	if is_colliding():
		if get_collider().get_name() == "Orbit":
			Sound.play("Orbit")
			explode()
			get_collider().set_damage(1)
			queue_free()
		if get_collider().get_name() == "Core":
			Sound.play("Core")
			get_collider().set_dead()
			queue_free()
			
func explode():
	var scene = load("res://MiniScenes/SmallExplosion.tscn")
	var explosion = scene.instance()
	get_tree().get_root().add_child(explosion)
	explosion.set_pos(get_pos())
	explosion.set_emitting(true)
	