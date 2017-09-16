
extends KinematicBody2D

var degrees = 0
var dir
var motion = Vector2()
var xaxis
var yaxis

<<<<<<< HEAD
export(float) var rot_speed = 90
=======
export(float) var speed = 90
>>>>>>> origin/master

var bulletscene = preload("res://MiniScenes/Bullet.tscn")
onready var bulletpos = get_node("BulletSpawn")
onready var sound = get_node("SamplePlayer")
<<<<<<< HEAD
onready var orbit = get_node("../Orbit")

# --------------------------------------------------------------------------
=======
>>>>>>> origin/master

func _ready():
	set_process_input(true)
	set_process(true)

func _process(delta):
		orbit_movement(delta)

func _input(event):
	if event.is_action_pressed("Shoot"):
<<<<<<< HEAD
		Sound.play("Shoot")
=======
		sound.play("Shoot")
>>>>>>> origin/master
		spawn_bullet(bulletscene)

# --------------------------------------------------------------------------

func orbit_movement(delta):
	if Input.is_action_pressed("Left"): #Input Left (Left Arrow, 'A') is true by tick.
		degrees += (rot_speed * delta) #Math to move degrees right.
	elif Input.is_action_pressed("Right"): #input Right (Right Arrow, 'D') is true by tick.
		degrees -= (rot_speed * delta) #Math to move degrees left.

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