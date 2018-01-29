extends Control

var remaining_shots
var limited_shots

func _ready():
	limited_shots = $"../World/Node2D".limited_shots
	if !limited_shots:
		$Label.text = "Unlimited number of shots"
	else:
		$Label.text = "Shots left: " + String($"../World/Node2D".remaining_shots)

func _process(delta):
	remaining_shots = $"../World/Node2D".remaining_shots

func on_fire():
	print("fired_hud")
	remaining_shots-=1
	if(remaining_shots>0):
		$Label.text = "Shots left: " + String(remaining_shots)


func game_over():
	print("game over")
	if ($"../World/Node2D".limited_shots) || $"../World".enemy_count>=20:
		$Label.text = "game over"