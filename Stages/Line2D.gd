extends Line2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_width(0)

func _process(delta):
	set_point_position(0, get_node("../Node2D/Player_1").position)
	set_point_position(1, get_node("../Node2D/Player_2").position)
