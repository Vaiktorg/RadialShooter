
extends StaticBody2D

var life = 10
<<<<<<< HEAD
var dead = false

func _ready():
	NodeData.add_data("OrbitDead", dead)
=======

func _ready():
>>>>>>> origin/master
	if SaveSystem.can_load():
		life = 10
	set_process(true)
	pass

func _process(delta):
	check_life()
	pass
	
func set_damage(val):
	life -= val
	
func check_life():
	if life <= 0:
<<<<<<< HEAD
		dead = true
		NodeData.add_data("OrbitDead", dead)
=======
>>>>>>> origin/master
		queue_free()
	


