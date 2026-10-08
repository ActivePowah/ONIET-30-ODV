class_name CollThing
extends CollisionPolygon2D

var visual_thing : Polygon2D

func _ready() -> void:
	visual_thing = Polygon2D.new()
	visual_thing.polygon = polygon
	add_child(visual_thing)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
