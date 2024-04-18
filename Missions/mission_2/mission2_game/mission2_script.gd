extends Node

@onready var cyber_bullying = get_node("Cyber Bullying")

var selected = []
var stylebox_flat := StyleBoxFlat.new()

func _ready():
	stylebox_flat.border_width_left = 1
	pass

func _on_cyber_bullying_pressed():
	cyber_bullying.add_stylebox_override("normal", stylebox_flat)
	selected.append('cyber_bullying')



func _on_defamation_pressed():
	pass # Replace with function body.


func _on_disclosure_pressed():
	pass # Replace with function body.


func _on_exclusion_pressed():
	pass # Replace with function body.


func _on_identity_theft_pressed():
	pass # Replace with function body.


func _on_mobbing_culture_pressed():
	pass # Replace with function body.


func _on_instigation_pressed():
	pass # Replace with function body.


func _on_online_deception_pressed():
	pass # Replace with function body.


func _on_online_harassment_pressed():
	pass # Replace with function body.
