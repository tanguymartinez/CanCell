extends Node2D
tool


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	pass

func _draw():
	draw_line($Player_1.position, $Player_2.position, Color(1,1,1),2, true)
	update()