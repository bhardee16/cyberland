extends Node



@onready var enter = get_tree().get_root().get_node("SocialMedia/Enter")

@onready var cyberbullying = get_tree().get_root().get_node("SocialMedia/PiecesContainer/HBoxContainer/Cyberbullying")

@onready var next = get_tree().get_root().get_node("SocialMedia/Next")

@onready var app = get_tree().get_root().get_node("SocialMedia/Application")

@onready var message = get_tree().get_root().get_node("SocialMedia/Message")



var unselected = true

var dict = read_file("res://Missions/mission_2/mission2_activity/applications.json")
var item: Dictionary
var item_index: int = 0

var selected = [];

func _ready():
	
	next.set_disabled(true)
	
	var hbox_containers = [
		get_tree().get_root().get_node("SocialMedia/PiecesContainer/HBoxContainer"),
		get_tree().get_root().get_node("SocialMedia/PiecesContainer/HBoxContainer2"),
		get_tree().get_root().get_node("SocialMedia/PiecesContainer/HBoxContainer3"),
		get_tree().get_root().get_node("SocialMedia/PiecesContainer/HBoxContainer4")
	]
	for hbox in hbox_containers:
		if hbox:
			for button in hbox.get_children():
				if button is Button:
					button.pressed.connect(_on_pressed.bind(button)) # Replace with function body.
	item = dict[item_index]
	app.text = item.application


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func read_file(file):
	var json_as_text = FileAccess.get_file_as_string(file)
	var json_as_dict = JSON.parse_string(json_as_text)
	return json_as_dict

func _on_pressed(button):
	message.set_text("")
	if (button): 
		if !selected.has(button):
			selected.push_back(button)
			button.set_button_icon(load("res://Images/Task 2 Selected Pieces/" + button.get_name() + "Selected.png"))
			button.set_pressed(true)
			print(selected)
			print(button.get_name())
			unselected = false;
		else:
			selected.erase(button)
			button.set_button_icon(load("res://Images/Task 2 Unselected Pieces/" + button.get_name() + "Unselected.png"))
			button.set_pressed(false)
			print("unselected")
			unselected = true;
				
func _is_correct():
	var correct = 0
	if(selected):
		for button in selected:
			if(item.answers.has(button.name)):
				print(button.name)
				correct += 1
			else:
				return false
		if(correct == len(item.answers)):
			return true
		else:
			return false
	else:
		return false
		
func _on_enter_pressed():
	if(_is_correct()):
		message.set_text("Good Job")
		print("correct")
		next.set_disabled(false)
		
	else:
		message.set_text("Try Again")
		_refresh_scene()
		print("try again")
		

func _refresh_scene():
	if (len(selected) > 0):
		next.set_disabled(true)
		var buttons_to_reset = selected.duplicate()
		for button in buttons_to_reset:
			selected.erase(button)
			button.set_button_icon(load("res://Images/Task 2 Unselected Pieces/" + button.get_name() + "Unselected.png"))

				
func _on_next_pressed():
	print(item_index)
	if (item_index >= 5):
		get_tree().change_scene_to_file("res://Missions/mission_2/mission2_activity/End_Screen.tscn")
	else:
		item_index+=1
		item = dict[item_index]
		app.text = item.application
		_refresh_scene()
	#else:
		#button.set_button_icon(load("res://Images/Task 2 Unselected Pieces/" + self.get_name() + "Unselected.png"))
		#button.set_pressed(false)
		#index = selected.indexof(self.get_name());
		#selected.splice(index, 1);
		#print("unselected")
		#unselected = true
