

extends Area2D

func _ready():
	var tween = create_tween().set_loops()
	tween.tween_property($StartButtonSm2, "modulate", Color(1, 1, 1, 1), 0.2)
	tween.tween_property($StartButtonSm2, "modulate", Color(0.2, 0.2, 0.2, 1), 0.2)
