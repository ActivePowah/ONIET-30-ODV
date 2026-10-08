extends Area2D

func _ready() -> void:
	body_entered.connect(matar.bind())
	pass

func matar(body:Node):
	get_tree().call_deferred("change_scene_to_file", "res://defeatscene.tscn")
