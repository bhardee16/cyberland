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
	


#func toggleNodeSelection(card):
	# BLAKE,  I originally connected all cards to this, but I wasn't sure how to pass in the card name
	# currently, all cards are still connected to this minus cyber_bullying -> go to on_cyber_bullying_pressed
	# Unhighlight any previously selected card
	#for card in selected:
		#var selected_node = get_node(card)
		#selected_node.modulate = Color(1, 1, 1, 1); # Reset to white
#
	## Highlight the pressed card
	#var pressed_card = get_node(card_name)
	#pressed_card.modulate = Color(1, 1, 0, 1); # Yellow highlight
#
	## Display the corresponding text in a location of your choice
	##var display_text = get_node("DisplayText")
	#display_text(card_name);
	##display_text.text = cardDescriptions[card_name]
#
	## Update selected card
	#selected.clear();
	#selected.append(card_name);
#
#func add_outline():
	#modulate = Color(0,1,0,1);
	#
#func remove_outline():
	#modulate = Color(1,1,1,1);
	#
	
#func display_text(card_name):
	#match card_name:
		#"cyber_bullying": "Sending messages containing threats or inducing fear to the cyber victim. Although it bears similarities to online harassment, here the cyber victim begins to worry about their own and their loved ones' safety."
		#"defamation": "The act of damaging a person's online reputation through gossip or lies is a form of cyberbullying. The goal is to put the cyber victim in a difficult situation, especially in front of their friends, family, or teachers."
		#"disclosure": "Sharing someone else's secrets or sending and posting photos, videos, and personal information that may cause embarrassment to others in online environments."
		#"exclusion": "To deliberately exclude someone from online developments or activities."
		#"identity_theft": "Gaining access to an account by learning or cracking someone else's password and engaging in conversations and sharing content as if you were that person."
		#"mobbing_culture": "Social media mobbing goes beyond an argument between users. Mobbing aims to demean, tarnish, and discredit the targeted person. Every statement of the targeted person is distorted and devalued, denying the victim a chance to defend themselves."
		#"instigation": "Online incitement involves using aggressive and threatening language online to provoke each other. This situation typically lasts shortly but can extend longer with others joining the bullying."
		#"online_deception": "Deceptive message texts, emails, advertisements, or websites using various methods to persuade someone to voluntarily provide personal information."
		#"online_harassment": "Continuously sending insulting or disturbing messages to an individual."


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