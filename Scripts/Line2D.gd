extends Line2D
tool
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	set_point_position(0,get_node("../Player_1").position)
	set_point_position(1,get_node("../Player_2").position)
