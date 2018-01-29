extends Node2D
var enemy
var last_time
var enemy_count=0
var MAX=20
export(PackedScene) var enemy_scene
signal number_changed(nb,pos_neg)
signal game_over()
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	randomize()
	last_time = OS.get_ticks_msec()
	connect("game_over", $"../HUD", "game_over")

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	pass
	
func _on_mitose(pos):
	print(pos)
	get_node("AudioSplit").play()
	spawn_enemy(false,pos)
	
func spawn_enemy(random=false,position=Vector2()):
	enemy = enemy_scene
	var enemy_node = enemy.instance().get_node(".")
	enemy_node.get_node("Timer").set_wait_time(rand_range(5, 10))
	enemy_node.get_node("Timer").start()
	enemy_node.get_node("Timer").connect("timed_out", self, "_on_mitose")
	if random:
		enemy_node.position = Vector2(rand_range(0,OS.window_size.x), rand_range(0,OS.window_size.y))
	else:
		enemy_node.position = position
	$Enemies.add_child(enemy_node)
	add_enemy()
	
func add_enemy():
	enemy_count+=1
	emit_signal("number_changed", enemy_count, true)
	if enemy_count>=20:
		emit_signal("game_over")

func remove_enemy():
	enemy_count-=1
	emit_signal("number_changed", enemy_count, false)

func _on_Enemy_added():
	print("enemy added")
	add_enemy() # replace with function body


func _on_Enemy_tree_exited():
	print("removing enemy")
	remove_enemy() # replace with function body

func check_zero():
	if(enemy_count==0):
		emit_signal("reached_zero")
		
func on_fire():
	print("on_fire world")
	if $Node2D.remaining_shots == 0 && enemy_count>0:
		emit_signal("game_over")