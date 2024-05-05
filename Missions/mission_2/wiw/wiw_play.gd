extends Node
var selected_cards = [];
var turn = 1;
var score = 0;
#var seen = [];
var correct = ["Good Job!", "Amazing!", "Wow, nice job!", "Quick thinking!", "You're great at this! :)"]
var incorrect = ["Try again :(", "Almsot got it, let's try again", "So close!", "You got it next time!"]

#var cards = {
	#'Cyber Bullying': Button#49190798575
	#,'Defamation':Button#49241130215
	#,'Exposure':Button#49291461857
	#,'Exclusion':Button#49375347932
	#,'Identity Theft':Button#49425679645
	#,'Mobbing Culture':Button#49476011296
	#,'Instigation':Button#49559897381
	#,'Online Deception':Button#49610229032
	#,'Online Harassment':Button#49660560683
#}

var resources = {
  1: {
	"example": "Ignoring someone's contributions or presence online.",
	"answer": "Exclusion"
  },
 2: {
	"example": "Deliberately leaving someone out of online activities or discussions.",
	"answer": "Exclusion"
  },
  3: {
	"example": "Sharing someone else's secrets or sending and posting embarrassing photos, videos, and personal information that may cause embarrassment to others in online environments.",
	"answer": "Exposure"
  },
  4: {
	"example": "Gaining access to someone's account and pretending to be them online.",
	"answer": "Identity Theft"
  },
 5: {
	"example": "Sending threatening messages inducing fear in the victim.",
	"answer": "Cyber Bullying"
  },
  6: {
	"example": "Distorting and devaluing every statement made by the targeted person.",
	"answer": "Mobbing Culture"
  },
  7: {
	"example": "Multiple people joining together to demean and discredit a targeted person online.",
	"answer": "Mobbing Culture"
  },
  8: {
	"example": "Continuously sending insulting or disturbing messages to an individual.",
	"answer": "Online Harassment"
  },
  9: {
	"example": "Spreading gossip or lies about a person online.",
	"answer": "Defamation"
  },
  10: {
	"example": "Making derogatory comments on someone's social media posts.",
	"answer": "Online Harassment"
  },
  11: {
	"example": "Creating fake websites or advertisements to trick people into providing personal information.",
	"answer": "Online Deception"
  },
  12: {
	"example": "Using someone else's password to engage in conversations or share content as if you were them.",
	"answer": "Identity Theft"
  },
  13: {
	"example": "Inciting conflict and hostility online.",
	"answer": "Instigation"
  },
  14: {
	"example": "Sending deceptive messages or emails to persuade someone to reveal personal information.",
	"answer": "Online Deception"
  },
  15: {
	"example": "Ignoring someone's contributions or presence online.",
	"answer": "Exclusion"
  },
  16: {
	"example": "Sharing someone's secrets online.",
	"answer": "Exposure"
  },
  17: {
	"example": "Gaining access to someone's account and pretending to be them online.",
	"answer": "Identity Theft"
  },
  18: {
	"example": "Making derogatory comments on someone's social media posts.",
	"answer": "Online Harassment"
  },
  19: {
	"example": "Using aggressive and threatening language online to provoke others.",
	"answer": "Instigation"
  },
  20: {
	"example": "Continuously sending insulting or disturbing messages to an individual.",
	"answer": "Online Harassment"
  },
  21: {
	"example": "Deliberately leaving someone out of online activities or discussions.",
	"answer": "Exclusion"
  },
  22: {
	"example": "Spreading gossip or lies about a person online.",
	"answer": "Defamation"
  },
  23: {
	"example": "Sending threatening messages inducing fear in the victim.",
	"answer": "Cyber Bullying"
  },
  24: {
	"example": "Creating fake websites or advertisements to trick people into providing personal information.",
	"answer": "Online Deception"
  },
  25: {
	"example": "Using someone else's password to engage in conversations or share content as if you were them.",
	"answer": "Identity Theft"
  }
}



func _ready():
	var save_data = save_manager.read_save()
	var parsed_data = JSON.parse_string(save_data)
	if typeof(parsed_data) == TYPE_DICTIONARY:
		score = int(parsed_data.score)
		get_node("Sprite2D/Score").text = str(score)
		turn = int(parsed_data.turn)
	else:
		# Handle the case where the data is not in the expected format
		print("Error: Saved data is not in the expected format")
	
	var hbox_containers = [
		get_node("VBoxContainer/HBoxContainer"),
		get_node("VBoxContainer/HBoxContainer2"),
		get_node("VBoxContainer/HBoxContainer3")
	]
	
	_read_in()
	
	for hbox in hbox_containers:
		if hbox:
			for card in hbox.get_children():
				if card is Button:
					card.pressed.connect(_on_card_pressed.bind(card))


			
func _on_card_pressed(card):
	if !selected_cards.has(card):
		deselect_all()
		selected_cards.append(card);
		card.modulate = Color.GREEN
	else:
		deselect_all()
		selected_cards.clear()

func deselect_all():
	if !selected_cards.is_empty():
		var cards_to_deselect = selected_cards.duplicate()
		selected_cards.clear()
		for card in cards_to_deselect:
			card.modulate = Color.AZURE
			

func _read_in():
	#var feat_text = ""
	get_node("Panel/Def sapce").text = resources[turn].example
	
func check():
	if(selected_cards):
		for card in selected_cards:
			if(resources[turn].answer == selected_cards[0].name):
				print(card.name)
				return true
			else:
				return false
	else:
		return false

func score_update(scored):
	if(scored):
		score += 1
		get_node("Sprite2D/Score").text = str(score)
	else:
		if(score == 0):
			return
		else:
			score -= 1
			get_node("Sprite2D/Score").text = str(score)


func _on_done_pressed():
	if(turn != 26):
		if(check()):
			turn += 1
			get_node("Panel/Def sapce").text = correct[randi_range(0, 4)]
			score_update(true)
			await get_tree().create_timer(2.0).timeout
			deselect_all()
			_read_in()
		else:
			get_node("Panel/Def sapce").text = incorrect[randi_range(0,3)]
			score_update(false)
			await get_tree().create_timer(2.0).timeout
			deselect_all()
			_read_in()
	else:
		get_node("Panel/Def sapce").text = "Great Job! \n You Scored: " + score;
		await get_tree().create_timer(3.0).timeout
		get_tree().change_scene_to_file('')
	save_manager.write_save(JSON.stringify({'turn':  turn, 'score': score}))
	


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Missions/mission_2/wiw/wiw_demo.tscn")
