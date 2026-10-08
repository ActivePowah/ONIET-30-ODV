class_name Nivel
extends Node2D

@export var spawn : Marker2D
var colisiones : Array[StaticBody2D]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for node in get_children():
		if node is StaticBody2D:
			colisiones.append(node)
	pass # Replace with function body.
