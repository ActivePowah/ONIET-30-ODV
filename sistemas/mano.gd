extends Node
var nodo_agarrado : ComponenteNivelador = null
var nodo_en_mano : bool = false

signal agarrar(esta_agarrando: bool)

func _notification(what: int) -> void:
	if what == NOTIFICATION_VP_MOUSE_EXIT or what == NOTIFICATION_WM_MOUSE_EXIT :
		if nodo_agarrado:
			nodo_agarrado.colocar(false)
			soltar_variables()


func _physics_process(delta: float) -> void:
	if !nodo_agarrado:
		return
	if Input.is_action_just_pressed("Left Click") and nodo_agarrado:
		if nodo_agarrado.jugador_encima:
			return
		nodo_en_mano = true
		agarrar.emit(true)
	if Input.is_action_pressed("Left Click"):
		if nodo_en_mano:
			nodo_agarrado.nivelar()
	if Input.is_action_just_released("Left Click"):
		if nodo_en_mano:
			nodo_agarrado.colocar(true)
			soltar_variables()


func soltar_variables():
	if nodo_agarrado:
		nodo_agarrado = null
	if nodo_en_mano:
		nodo_en_mano = false
	agarrar.emit(false)

func mouse_exited():
	if nodo_en_mano:
		return
	soltar_variables()

func mouse_entered(nodo):
	if nodo_en_mano:
		return
	if !nodo_agarrado:
		nodo_agarrado = nodo 
