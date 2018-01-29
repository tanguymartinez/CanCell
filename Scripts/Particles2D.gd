extends Particles2D
export(NodePath) var player1
export(NodePath) var player2

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	var pnode1 = get_node(player1)
	var pnode2 = get_node(player2)
	var vect = pnode1.position-pnode2.position
	position = pnode1.position-vect/2
	rotation = vect.angle()
	process_material.set_emission_box_extents(Vector3(vect.length()/2,2,0))
	