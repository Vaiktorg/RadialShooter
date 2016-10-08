
extends StaticBody2D

var life = 10

func _ready():
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
		queue_free()
	


