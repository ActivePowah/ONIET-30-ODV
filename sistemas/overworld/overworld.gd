extends Node2D

@export var niveles : Array[PackedScene]
@export var jugador : Jugador

var nivel_ahora : Nivel

func _ready() -> void:
	cambiar_nivel(0)
	
func cambiar_nivel(numero : int):
	if nivel_ahora:
		nivel_ahora.queue_free()
	nivel_ahora = niveles[numero].instantiate()
	jugador.global_position = nivel_ahora.spawn.global_position
	add_child(nivel_ahora)
