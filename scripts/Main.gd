extends Node

onready var player = $player
var lives = 3;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	hurt_player()
	
func hurt_player() :
	if lives > 0 :
		lives = lives-1;
		player.get_node("Lives").text = "Vies: " + str(lives)
		player.position = $Spawn.position
	else :
		$lose.visible = true
		$restart.visible = true
		player.queue_free();

func _on_endArea_body_entered(body):
	$win.visible = true
	$restart.visible = true
	player.queue_free()


func _on_Restart_pressed():
	get_tree().reload_current_scene()
