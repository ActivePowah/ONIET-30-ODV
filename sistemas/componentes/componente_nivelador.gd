extends Node2D
class_name ComponenteNivelador

@export var nodo_a_nivelar: Node2D
@export var area_de_agarre: Area2D
@export var area_de_deteccion: Area2D

var rotacion_inicial: float
var jugador_encima: bool = false

func _ready() -> void:
	rotacion_inicial = nodo_a_nivelar.rotation
	area_de_agarre.mouse_entered.connect(_on_mouse_entered)
	area_de_agarre.mouse_exited.connect(_on_mouse_exited)
	area_de_deteccion.body_entered.connect(func(body):
		if body is Jugador:
			jugador_encima = true
		)

func _on_mouse_entered():
	Mano.mouse_entered(self)

func _on_mouse_exited():
	Mano.mouse_exited()

func colocar(exitoso: bool):
	if !exitoso:
		nodo_a_nivelar.rotation = rotacion_inicial

var mouse_offset: Vector2 = Vector2.ZERO

func obtener_mouse_offset():
	mouse_offset = get_global_mouse_position()

func nivelar():
	if jugador_encima:
		return
	var angulo_hacia_mouse : float = (nodo_a_nivelar.global_position).angle_to_point(get_global_mouse_position())
	var peso : float = 0.1
	nodo_a_nivelar.rotation = lerp_angle(nodo_a_nivelar.rotation, angulo_hacia_mouse, peso)
