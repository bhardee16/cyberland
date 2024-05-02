extends Button

var unselected = true
#var SelectedNames = ["CyberbullyingSelected.png", "DefamationSelected.png", "ExclusionSelected.png", ]
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_pressed():
	if (unselected): 
		self.set_button_icon(load("res://Images/Task 2 Selected Pieces/" + self.get_name() + "Selected.png"))
		print("selected")
		print(self.get_name())
		unselected = false;
	else:
		self.set_button_icon(load("res://Images/Task 2 Unselected Pieces/" + self.get_name() + "Unselected.png"))
		print("unselected")
		unselected = true
