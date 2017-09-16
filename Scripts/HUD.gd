
extends Control

onready var points = get_node("PointLabel/Points")
onready var wave = get_node("WaveLabel/Wave")
var seconds = 0

func _ready():
	set_process(true)

func _process(delta):
	points.set_text(str(Points.points))
	wave.set_text(str(Points.wave))
