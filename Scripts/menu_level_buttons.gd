extends Button
signal pressed_args(id)

func _ready():
	connect("pressed", self, "on_button_pressed")
	connect("pressed_args", get_node("/root/GameManager"), "on_Button_load_scene")
	pass

func _process(delta):

	pass

func on_button_pressed():
	emit_signal("pressed_args", get_position_in_parent())