extends Node
var MAX=20
# class member variables go here, for example:
var last_time
var timing=false
var change_level=false
signal level_finished
signal level_restarted

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	connect("level_finished", get_node("/root/GameManager"), "on_Game_level_finished")
	connect("level_restarted", get_node("/root/GameManager"), "on_Game_restart_level")


func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	if(timing):
		change_level=true
		last_time = OS.get_ticks_msec()
		timing=false
	if(change_level):
		$HUD/countdown.text = String(5-(OS.get_ticks_msec()-last_time)/1000)
	if(change_level && OS.get_ticks_msec()-last_time>5000):
			change_level=false
			emit_signal("level_finished")
			


func _on_World_number_changed( nb, pos_neg ):
	print(nb)
	if(pos_neg):
		$HUD/CancerLevel/BarCancerLevel.max_value = nb
	$HUD/CancerLevel/BarCancerLevel.value = nb
	if(nb==0):
		$HUD/Label.text = "Well done!"
		timing=true