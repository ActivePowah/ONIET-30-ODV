extends CanvasLayer


func _ready() -> void:
	visible = false
	Mano.agarrar.connect(func(mostrar : bool):
		visible = mostrar
		if mostrar:
			Engine.time_scale = 0.2
		else:
			Engine.time_scale = 1.0
		)
