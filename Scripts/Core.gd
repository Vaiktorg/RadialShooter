
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	set_gravity_is_point(true)
	NodeData.add_pos_data("CorePos", self.get_global_pos())
	pass


