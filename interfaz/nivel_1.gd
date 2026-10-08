extends Button


func _ready() -> void:
	pressed.connect(func():
		get_tree().change_scene_to_file("res://sistemas/overworld/nivel_1.tscn")
		)
