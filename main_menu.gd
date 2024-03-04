extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_map_btn_pressed():
	get_tree().change_scene_to_file("res://cyberland_map.tscn")

func _on_collections_btn_pressed():
	get_tree().change_scene_to_file("res://collections.tscn")

func _on_shop_btn_pressed():
	get_tree().change_scene_to_file("")

func _on_questions_btn_pressed():
	get_tree().change_scene_to_file("")

func _on_avatar_btn_pressed():
	get_tree().change_scene_to_file("res://avatar.tscn")

func _on_files_btn_pressed():
	get_tree().change_scene_to_file("res://files.tscn")

func _on_resources_btn_pressed():
	get_tree().change_scene_to_file("")
	


