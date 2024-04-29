extends Node
var selected_cards = [];

func _ready():
	for card in get_tree().get_nodes_in_group("VBoxContainer"):
		card.connect("toggled", _on_card_toggled, 0)
		card.connect("toggled", _on_card_toggled, 0)

func _on_card_toggled(card, toggled):
	if toggled:
		selected_cards.append(card)
		#card.modulate = Color8(251, 247, 25)  # Change the color when selected
	else:
		selected_cards.erase(card)
		#card.modulate = Color.AZURE  # Change the color when deselected


func _on_cyber_bullying_toggled(toggled_on):
	_on_card_toggled(get_node("VboxContainer/HboxContainer/Cyber Bullying"), toggled_on)


func _on_defamation_toggled(toggled_on):
	_on_card_toggled(get_node("VboxContainer/HboxContainer/Defamation"), toggled_on)


func _on_disclosure_toggled(toggled_on):
	_on_card_toggled(get_node("VboxContainer/HboxContainer/Disclosure"), toggled_on)


func _on_exclusion_toggled(toggled_on):
	_on_card_toggled(get_node("VboxContainer/HboxContainer2/Exclusion"), toggled_on)


func _on_identity_theft_toggled(toggled_on):
	_on_card_toggled(get_node("VboxContainer/HboxContainer2/Identity Theft"), toggled_on)


func _on_mobbing_culture_toggled(toggled_on):
	_on_card_toggled(get_node("VboxContainer/HboxContainer2/Mobbing Culture"), toggled_on)


func _on_instigation_toggled(toggled_on):
	_on_card_toggled(get_node("VboxContainer/HboxContainer3/Instigation"), toggled_on)


func _on_online_deception_toggled(toggled_on):
	_on_card_toggled(get_node("VboxContainer/HboxContainer3/Online Deception"), toggled_on)


func _on_online_harassment_toggled(toggled_on):
	_on_card_toggled(get_node("VboxContainer/HboxContainer3/Online Harassment"), toggled_on)


func _on_done_pressed():
	get_tree().quit()
