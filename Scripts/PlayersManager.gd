extends Node2D
var player1_pressed
var player2_pressed
var pressed=false
var player1
var player2
var last_time
signal can_fire()
signal game_over()
export(int) var remaining_shots = 0
export(bool) var limited_shots = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	player1 = get_node("Player_1")
	player2 = get_node("Player_2")
	connect("can_fire", $"../../HUD", "on_fire")
	connect("can_fire", $"..", "on_fire")
	player1_pressed = -1000
	player2_pressed = -1000
	last_time = -3000

func _process(delta):
	
	$Player_1/RaycastP1.cast_to = $Player_2.position - $Player_1.position
	$Player_1/RayCastWalls.cast_to = $Player_2.position - $Player_1.position
	if(Input.is_action_just_pressed("shoot_Player_1")):
		player1_pressed = OS.get_ticks_msec()
	if(Input.is_action_just_pressed("shoot_Player_2")):
		player2_pressed = OS.get_ticks_msec()
	if (!limited_shots || remaining_shots > 0) && !$Player_1/RayCastWalls.is_colliding() && abs(player1_pressed - player2_pressed) < 500 && OS.get_ticks_msec() - last_time > 2000 && Input.is_action_pressed("shoot_Player_1") && Input.is_action_pressed("shoot_Player_2"):
		remaining_shots -=1
		emit_signal("can_fire")
		last_time = OS.get_ticks_msec()
		
	
func on_fire():
	var exploded = false
	if $Player_1/RaycastP1.is_colliding():
		while $Player_1/RaycastP1.get_collider().is_in_group("Enemies"):
			exploded = true
			$Player_1/RaycastP1.get_collider().free()
			$Player_1/RaycastP1.force_raycast_update()
	if exploded:
		get_node("../AudioBurst").play()