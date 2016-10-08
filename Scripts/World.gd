
extends Node2D

onready var timer = get_node("Timer")
onready var core = get_node("Core")
onready var spawner = get_node("Spawner")

func _ready():
	Points.points = 0
	Points.wave = 1
	NodeData.Data.SpawnRate = 1
	
	for ast in get_tree().get_nodes_in_group("Asteroid"):
		ast.queue_free()
	if SaveSystem.can_load():
		SaveSystem.load_file()

	Sound.node = get_node("SamplePlayer")
	timer.start()
	pass

func _on_Timer_timeout():
	Points.wave += 1
	NodeData.Data.SpawnRate -= .1
	timer.start()

