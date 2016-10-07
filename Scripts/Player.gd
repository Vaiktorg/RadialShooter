
extends Node2D

var degrees = 0

export(float) var speed = 200
export(float) var max_speed = 400

var bulletscene = preload("res://MiniScenes/Bullet.tscn")
onready var bulletpos = get_node("BulletSpawn")

func _ready():
	set_process_input(true)

func _input(event):
	movement(event)
	if event.is_action_pressed("Shoot"):
		spawn_bullet(bulletscene)

# --------------------------------------------------------------------------

func movement(event):
	if event.is_action_pressed("Left"): #Input Left (Left Arrow, 'A') is true by tick.
		degrees += (speed) #Math to move degrees right.
	elif event.is_action_pressed("Right"): #input Right (Right Arrow, 'D') is true by tick.
		degrees -= (speed) #Math to move degrees left.

		#Hacerle un ease in/out (accelerar, desacelerar) seria bueno :3

	if degrees >= 360 or degrees <= -360: #Clamped degrees incase we could use this variable for something.
		degrees = 0

	set_rotd(degrees) #set_rotd(degrees) will rotate the actor in degrees. Note the 'd' after 'rot'.

# --------------------------------------------------------------------------

func spawn_bullet(scene):
	var bullet = bulletscene.instance()
	get_tree().get_root().add_child(bullet)
	bullet.set_pos(bulletpos.get_global_pos())
	bullet.set_direction(degrees)
	bullet.set_rotd(degrees)

# --------------------------------------------------------------------------

#	Como metodo de que diera vuelta alrededor de la orbita guia, utilize el anchor offset
#	del sprite node para que pudiera rotar con el anchor detras. A este, atache un position
#	node, por donde va a instance (spawn) las balitas :D
#
#	No tengo las balas hechas, ni tengo el input map de disparar hecho.