extends Area2D

@export var final_victory : bool = false

func _ready() -> void:
	body_entered.connect(ganar.bind())
	pass

func ganar(_body:Node):
	var scene:String = "res://victoryscene.tscn" if not final_victory else "res://finalvictory.tscn"
	get_tree().call_deferred("change_scene_to_file", scene)
	AudioManager.play_music(AudioManager.canciones[AudioManager.Canciones.VICTORIA])
