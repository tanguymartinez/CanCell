extends Node2D
var level_array = ['level_01.tscn', 'level_02.tscn', 'level_03.tscn', 'level_04.tscn', 'level_05.tscn','level_06.tscn']
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var ind_scene=0
var current_scene=null
var audio_stream
var audio_scene = load("res://Scenes/AudioPlayer.tscn")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var root=get_tree().get_root()
	current_scene=root.get_node("Game")
	audio_scene = audio_scene.instance()
	add_child(audio_scene)

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	if Input.is_action_just_released("restart_level"):
		restart_level()
		
	if Input.is_action_just_released("go_to_menu"):
		get_tree().change_scene("res://Stages/Main_menu.tscn")

func restart_level():
	get_tree().reload_current_scene()

func on_Button_restart_level():
	restart_level()

func on_Game_restart_level():
	restart_level()

func _on_Game_level_finished():
	next_scene()

func on_Button_load_scene(pos_in_parent):
	_load_scene(pos_in_parent)

func _load_scene(pos_in_parent):
	ind_scene = pos_in_parent
	get_tree().change_scene("res://Stages/level_0%d.tscn" % (pos_in_parent+1))

func goto_scene(path):

    # This function will usually be called from a signal callback,
    # or some other function from the running scene.
    # Deleting the current scene at this point might be
    # a bad idea, because it may be inside of a callback or function of it.
    # The worst case will be a crash or unexpected behavior.

    # The way around this is deferring the load to a later time, when
    # it is ensured that no code from the current scene is running:

    call_deferred("_deferred_goto_scene",path)


func _deferred_goto_scene(path):
#	print(path)
#    # Immediately free the current scene,
#    # there is no risk here.
#	current_scene.queue_free()
#    # Load new scene
#	var s = ResourceLoader.load("res://Stages/"+path)
#
#    # Instance the new scene
#	current_scene = s.instance()
#
#    # Add it to the active scene, as child of root
#	get_tree().get_root().add_child(current_scene)
#
#    # optional, to make it compatible with the SceneTree.change_scene() API
#	get_tree().set_current_scene( current_scene )
	get_tree().change_scene(path)
	
func next_scene():
#	goto_scene(level_array[ind_scene+1])
	get_tree().change_scene("res://Stages/"+ String(level_array[ind_scene+1]))
	ind_scene += 1