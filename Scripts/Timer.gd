extends Timer
signal timed_out(position)
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Timer_timeout():
	print(get_parent().position)
	emit_signal("timed_out", get_parent().position) # replace with function body
	