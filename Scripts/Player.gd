extends RigidBody2D

export var vel = 5
export(NodePath) var other_player
var force = Vector2(0,0)
var fire = false
signal object_detected(obj)
signal fire()

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	force = Vector2(0,0)
	if Input.is_action_pressed("up_%s" % name):
		force += Vector2(0, -1)
	if Input.is_action_pressed("down_%s" % name):
		force += Vector2(0,1)
	if Input.is_action_pressed("right_%s" % name):
		force += Vector2(1, 0)
	if Input.is_action_pressed("left_%s" % name):
		force += Vector2(-1, 0)
	force = force.normalized() * vel
	applied_force = force;

	$RayCast2D.cast_to = get_node(other_player).position - position
	if (fire):
		$AnimatedSprite.play("default")
		$AnimatedSprite.frame = 0
		$"../../Particles2D".emitting=true
		if $RayCast2D.is_colliding():
			emit_signal("object_detected", $RayCast2D.get_collider())
		get_node("../../AnimationPlayer").play("animation_line")
		get_node("../../AudioShoot").play()
		fire=false

func _on_Player_1_object_detected( obj ):
	if $RayCast2D.is_colliding():
		if(obj.name==$RayCast2D.get_collider().name):
			get_node("..").remove_child(obj)
			obj.queue_free()


#class Timer:
#	var last_time
#	func _init():
#		last_time = OS.get_ticks_msec()
#
#	func get_elapsed_time():
#		return OS.get_ticks_msec() - last_time
#
#	func restart():
#		last_time = OS.get_ticks_msec()

func _on_Node2D_can_fire():
	fire=true # replace with function body
