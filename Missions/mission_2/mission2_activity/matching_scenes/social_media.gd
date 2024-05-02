extends Node  


# Called when the node enters the scene tree for the first time.
func _ready():
	var button = get_tree().get_root().get_node("PiecesContainer/HBoxContainer/Cyberbullying")
	#button.connect("pressed",_on_cyberbullying_pressed(self), 0)
	#for piece in get_tree().get_nodes_in_group("PiecesContainer"):
		#piece.connect("press", _on_piece_pressed(self), 0)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
##
#func _on_piece_pressed(piece):
	#var selected = false
	##var path = piece.get_path 
	##var name = piece.get_name
	#if selected:
			#piece.modulate = Color.AZURE;
		##$name.set_button_icon(path)
	
	
	
	
	
	
#func _on_cyberbullying_pressed(piece): 
	#var button = get_node("/Social Media/PiecesContainer/HBoxContainer/Cyberbullying")
	#var select = false
	#var selected_picture = load("res://Images/Task 2 Selected Pieces/CyberbullyingSelected.png")
	#var unselected_picture = load("res://Images/Task 2 Unselected Pieces/CyberbullyingUnselected.png")
	#if !select && button != null:
		#button.set_button_icon(selected_picture)
		#select = true 
	#if select: 
		#button.set_button_icon(selected_picture)
		#select = false 
#
		#
#
#
#func _on_defamation_pressed():
	#pass # Replace with function body.

