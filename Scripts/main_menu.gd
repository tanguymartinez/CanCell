extends Control
var levels
var button
var level_number = 1
signal level_param
export(GDScript) var button_script

func _ready():
	levels = get_node("/root/GameManager").level_array
	for level in levels:
		button = Button.new()
		button.set_script(button_script)
		button.text = "Level_%s" % level_number
		$ScrollContainer/VBoxContainer.add_child(button)
		level_number += 1

func _process(delta):
	
	pass