class_name Jugador
extends CharacterBody2D

@export var aceleracion : float = 45
@export var aceleracion_maxima : float = 300
@export var gravedad : float = 400

@export var sprite : AnimatedSprite2D
@export var humo : AnimatedSprite2D
@export var camara : Camera2D

var landed : bool = false

func _physics_process(delta: float) -> void:
	velocity.x = move_toward(velocity.x, aceleracion_maxima, aceleracion)
	if is_on_wall():
		velocity.x = 0
	if not is_on_floor():
		if landed:
			get_tree().create_timer(0.1).timeout.connect(_check_on_floor)
		else:
			landed = false
			velocity.y = move_toward(velocity.y, gravedad, 100)
	else:
		if humo and not landed and not humo.is_playing():
			humo.play(&"default")
			humo.frame = 0
			landed = true
		velocity.y = 0
		
	if camara:
		camara.offset = lerp(camara.offset, get_real_velocity() * 0.5, delta * 2)
	move_and_slide()

func _check_on_floor():
	if not is_on_floor():
		landed = false
		velocity.y = move_toward(velocity.y, gravedad, 100)
