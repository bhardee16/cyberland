extends Node2D

signal press

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_start_btn_pressed():
	get_tree().change_scene_to_file("res://start_seq/player.tscn")
	emit_signal("press")
