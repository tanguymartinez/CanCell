extends Node2D
var last_time
var updated=false
var first_loop=true

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	last_time=OS.get_ticks_msec();

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	$RayCast2D.cast_to = get_node("Player_2").position - get_node("Player_1").position
	if player_action():
		if !updated:
			last_time = OS.get_ticks_msec()
			print(last_time)
			updated=true
	if combo() && (first_loop || OS.get_ticks_msec() - last_time > 3000):
		$"../Particles2D".emitting=true
		updated=false
		first_loop=false
		
func player_action():
	return (Input.is_action_pressed("shoot_Player_1") || Input.is_action_pressed("shoot_Player_2"))
	
func combo():
	return (Input.is_action_pressed("shoot_Player_1") && Input.is_action_pressed("shoot_Player_2"))