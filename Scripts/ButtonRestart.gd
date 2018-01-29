extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	connect("pressed", get_node("/root/GameManager"), "on_Button_restart_level")

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	pass
