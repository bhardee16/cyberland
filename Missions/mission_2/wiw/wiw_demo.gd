#extends Node
#var selected_cards = [];
#
#var cardDescriptions = {
	#"Cyber Bullying": "Sending messages containing threats or inducing fear to the cyber victim. Although it bears similarities to online harassment, here the cyber victim begins to worry about their own and their loved ones' safety.",
	#"Defamation": "The act of damaging a person's online reputation through gossip or lies is a form of cyberbullying. The goal is to put the cyber victim in a difficult situation, especially in front of their friends, family, or teachers.",
	#"Disclosure": "Sharing someone else's secrets or sending and posting photos, videos, and personal information that may cause embarrassment to others in online environments.",
	#"Exclusion": "To deliberately exclude someone from online developments or activities.",
	#"Identity Theft": "Gaining access to an account by learning or cracking someone else's password and engaging in conversations and sharing content as if you were that person.",
	#"Mobbing Culture": "Social media mobbing goes beyond an argument between users. Mobbing aims to demean, tarnish, and discredit the targeted person. Every statement of the targeted person is distorted and devalued, denying the victim a chance to defend themselves.",
	#"Instigation": "Online incitement involves using aggressive and threatening language online to provoke each other. This situation typically lasts shortly but can extend longer with others joining the bullying.",
	#"Online Deception": "Deceptive message texts, emails, advertisements, or websites using various methods to persuade someone to voluntarily provide personal information.",
	#"Online Harassment": "Continuously sending insulting or disturbing messages to an individual."
#}
#
#func _ready():
	#for card in get_tree().get_nodes_in_group("VBoxContainer"):
		#card.connect("press", _on_card_pressed(self), 0)
#
#
#func _on_card_pressed(card):
	##card.modulate = Color.YELLOW;
	##selected_cards.append(card);
	#get_node("Panel/Def sapce").text = cardDescriptions[card.name];
#
#func _on_card_depressed(card):
	#card.modulate = Color.AZURE;
	##selected_cards.erase(card);
	#get_node("Panel/Def sapce").text = "Def Space."
#
#func selected(card):
	#var index = selected_cards.find(card);
	#if(len(selected_cards) == 1):
		#if(index == -1):
			#selected_cards.append(card);
			#_on_card_pressed(card)
		#else:
			#selected_cards.remove_at(index)
			#_on_card_depressed(card)
	#else:
		#
		#selected_cards.append(card);
		#_on_card_pressed(card)
#
#
#func _on_cyber_bullying_pressed():
	#selected(get_node("VBoxContainer/HboxContainer/Cyber Bullying"))
#
#
#func _on_defamation_pressed():
	#selected(get_node("VBoxContainer/HBoxContainer/Defamation"))
#
#
#func _on_disclosure_pressed():
	#selected(get_node("VBoxContainer/HBoxContainer/Disclosure"))
#
#
#func _on_exclusion_pressed():
	#selected(get_node("VBoxContainer/HBoxContainer2/Exclusion"))
#
#
#func _on_identity_theft_pressed():
	#selected(get_node("VBoxContainer/HBoxContainer2/Identity Theft"))
#
#
#func _on_mobbing_culture_pressed():
	#selected(get_node("VBoxContainer/HBoxContainer2/Mobbing Culture"))
#
#
#func _on_instigation_pressed():
	#selected(get_node("VBoxContainer/HBoxContainer3/Instigation"))
#
#
#func _on_online_deception_pressed():
	#selected(get_node("VBoxContainer/HBoxContainer3/Online Deception"))
#
#
#func _on_online_harassment_pressed():
	#selected(get_node("VBoxContainer/HBoxContainer3/Online Harassment"))
#
#
#func _on_play_pressed():
	#get_tree().change_scene_to_file("res://Missions/mission_2/wiw/wiw_play.tscn")
	
extends Node
var selected_cards = [];

var cardDescriptions = {
	"Cyber Bullying": "Sending messages containing threats or inducing fear to the cyber victim. Although it bears similarities to online harassment, here the cyber victim begins to worry about their own and their loved ones' safety.",
	"Defamation": "The act of damaging a person's online reputation through gossip or lies is a form of cyberbullying. The goal is to put the cyber victim in a difficult situation, especially in front of their friends, family, or teachers.",
	"Disclosure": "Sharing someone else's secrets or sending and posting photos, videos, and personal information that may cause embarrassment to others in online environments.",
	"Exclusion": "To deliberately exclude someone from online developments or activities.",
	"Identity Theft": "Gaining access to an account by learning or cracking someone else's password and engaging in conversations and sharing content as if you were that person.",
	"Mobbing Culture": "Social media mobbing goes beyond an argument between users. Mobbing aims to demean, tarnish, and discredit the targeted person. Every statement of the targeted person is distorted and devalued, denying the victim a chance to defend themselves.",
	"Instigation": "Online incitement involves using aggressive and threatening language online to provoke each other. This situation typically lasts shortly but can extend longer with others joining the bullying.",
	"Online Deception": "Deceptive message texts, emails, advertisements, or websites using various methods to persuade someone to voluntarily provide personal information.",
	"Online Harassment": "Continuously sending insulting or disturbing messages to an individual."
}

func _ready():
	for card in get_tree().get_nodes_in_group("VBoxContainer"):
		card.connect("press", _on_card_pressed(self), 0)
		
		
func _on_card_pressed(card):
	#card.modulate = Color.GREEN;
	get_node("Panel/Def sapce").text = cardDescriptions[card.name];

func _on_card_depressed(card):
	card.modulate = Color.AZURE;
	get_node("Panel/Def sapce").text = "Def Space."


func selected(card):
	var index = selected_cards.find(card);
	if(len(selected_cards) == 1):
		if(index == -1):
			selected_cards.append(card);
			_on_card_pressed(card)
		else:
			selected_cards.remove_at(index)
			_on_card_depressed(card)
	else:
		
		selected_cards.append(card);
		_on_card_pressed(card)


func _on_cyber_bullying_pressed():
	selected(get_node("VBoxContainer/HBoxContainer/Cyber Bullying"))


func _on_defamation_pressed():
	selected(get_node("VBoxContainer/HBoxContainer/Defamation"))

func _on_disclosure_pressed():
	selected(get_node("VBoxContainer/HBoxContainer/Disclosure"))


func _on_exclusion_pressed():
	selected(get_node("VBoxContainer/HBoxContainer2/Exclusion"))


func _on_identity_theft_pressed():
	selected(get_node("VBoxContainer/HBoxContainer2/Identity Theft"))


func _on_mobbing_culture_pressed():
	selected(get_node("VBoxContainer/HBoxContainer2/Mobbing Culture"))


func _on_instigation_pressed():
	selected(get_node("VBoxContainer/HBoxContainer3/Instigation"))


func _on_online_deception_pressed():
	selected(get_node("VBoxContainer/HBoxContainer3/Online Deception"))


func _on_online_harassment_pressed():
	selected(get_node("VBoxContainer/HBoxContainer3/Online Harassment"))


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Missions/mission_2/wiw/wiw_play.tscn")
