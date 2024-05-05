extends Node
var selected_cards = [];

var cardDescriptions = {
	"Cyber Bullying": "Sending messages containing threats or inducing fear to the cyber victim. Although it bears similarities to online harassment, here the cyber victim begins to worry about their own and their loved ones' safety.",
	"Defamation": "The act of damaging a person's online reputation through gossip or lies is a form of cyberbullying. The goal is to put the cyber victim in a difficult situation, especially in front of their friends, family, or teachers.",
	"Exposure": "Sharing someone else's secrets or sending and posting photos, videos, and personal information that may cause embarrassment to others in online environments.",
	"Exclusion": "To deliberately exclude someone from online developments or activities.",
	"Identity Theft": "Gaining access to an account by learning or cracking someone else's password and engaging in conversations and sharing content as if you were that person.",
	"Mobbing Culture": "Mobbing goes beyond an argument between users. Mobbing aims to demean, tarnish, and discredit the targeted person. Every statement of the targeted person is distorted and devalued, denying the victim a chance to defend themselves.",
	"Instigation": "Incitement involves using aggressive and threatening language online to provoke each other. This situation typically lasts shortly but can extend longer with others joining the bullying.",
	"Online Deception": "Deceptive message texts, emails, advertisements, or websites using various methods to persuade someone to voluntarily provide personal information.",
	"Online Harassment": "Continuously sending insulting or disturbing messages to an individual."
}

func _ready():
	var hbox_containers = [
		get_node("VBoxContainer/HBoxContainer"),
		get_node("VBoxContainer/HBoxContainer2"),
		get_node("VBoxContainer/HBoxContainer3")
	]
	
	for hbox in hbox_containers:
		if hbox:
			for card in hbox.get_children():
				if card is Button:
					card.pressed.connect(_on_card_pressed.bind(card))
		
func _on_card_pressed(card):
	deselect_all()
	get_node("Panel/Def sapce").text = cardDescriptions[card.name]
	selected_cards.append(card);
	card.modulate = Color.GREEN


func deselect_all():
	if !selected_cards.is_empty():
		var cards_to_deselect = selected_cards.duplicate()
		selected_cards.clear()
		for card in cards_to_deselect:
			card.modulate = Color.AZURE
		get_node("Panel/Def sapce").text = "Def Space."

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Missions/mission_2/wiw/wiw_play.tscn")
