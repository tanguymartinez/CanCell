extends RigidBody2D
export(bool) var can_split = true
export(bool) var follows = true
export(int) var split_time = 5
var pick_player
signal added()

func _ready():
	connect("added", get_node("../.."), "_on_Enemy_added")
	connect("tree_exited", get_node("../.."), "_on_Enemy_tree_exited")
	pick_player = randi() % 2
	get_node("Timer").set_wait_time(rand_range(split_time*0.5, split_time*2))
	get_node("Timer").start()
	emit_signal("added")
	if can_split:
		get_node("Timer").connect("timed_out", get_node("../../../World"), "_on_mitose")

func _process(delta):
	if follows:
		applied_force = Vector2(get_node("../../Node2D/Player_%d" % (pick_player+1)).position - position).normalized() * 10
	