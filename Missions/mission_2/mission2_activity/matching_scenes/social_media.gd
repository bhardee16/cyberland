extends Node  


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cyberbullying_pressed(): 
	var select = false
	var node = get_node("Images/Task 2 Selected Pieces/CyberbullyingSelected.png")
	if !select:
		get_node("Images/Task 2 Selected Pieces/CyberbullyingSelected.png")
		#set_button_icon(load("res://Images/Task 2 Selected Pieces/CyberbullyingSelected.png"))
		select = true 
	if select: 
		$Cyberbullying.set_button_icon(load("res://Images/Task 2 Unselected Pieces/CyberbullyingUnselected.png"))
		select= false 
		
