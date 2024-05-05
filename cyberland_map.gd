extends Node2D

# button variables
@onready var mission1Btn = $Task1_Button
@onready var mission2Btn = $Task2_Button
@onready var mission3Btn = $Task3_Button
@onready var mission4Btn = $Task4_Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_task_1_button_pressed():
	get_tree().change_scene_to_file("res://Missions/mission_1/task1.tscn")

func _on_task_2_button_pressed():
	get_tree().change_scene_to_file("res://Missions/mission_2/wiw/wiw_demo.tscn")

func _on_task_3_button_pressed():
	get_tree().change_scene_to_file("res://Missions/mission_2/mission2_activity/activity_start.tscn")

