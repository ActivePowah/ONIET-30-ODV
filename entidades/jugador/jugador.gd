extends CharacterBody2D

@export var aceleracion : float = 45
@export var aceleracion_maxima : float = 300
@export var gravedad : float = 400

@export var sprite : AnimatedSprite2D
@export var humo : AnimatedSprite2D

var landed : bool = false

func _physics_process(delta: float) -> void:
	velocity.x = move_toward(velocity.x, aceleracion_maxima, aceleracion)
	if is_on_wall():
		velocity.x = 0
	if not is_on_floor():
		landed = false
		velocity.y = move_toward(velocity.y, gravedad, 100)
	else:
		if humo and not landed:
			humo.play(&"default")
			humo.frame = 0
			landed = true
		velocity.y = 0
	move_and_slide()
