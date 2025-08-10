extends Sprite2D

func _ready():
	var tween = create_tween().set_loops() # repete para sempre
	tween.tween_property(self, "modulate", Color(1,1,1,1), 0.5) # branco
	tween.tween_property(self, "modulate", Color(0.5,0.5,0.5,1), 0.5) # cinza
