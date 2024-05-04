extends Node
var selected_cards = [];
var turn = 1;
var score = 0;

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
	load_game();
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

func save():
	var file = FileAccess.open('res://save.json', FileAccess.WRITE)
	var save_data = {
		"turn": turn, 
		"score": score
	}
	file.store_line(var_to_str(save_data));
	file = null;
	
func load_game():
	var file = FileAccess.open('res://save.json', FileAccess.READ)
	var content = file.get_as_text()
	turn = content.save_data.turn;
	score = content.save_data.score;
	file = null;

func _on_card_pressed(card):
	if(len(selected_cards) == 0):
		selected_cards.append(card);
		card.modulate = Color.GREEN
	else:
		return
			
func deselect_all():
	if !selected_cards.is_empty():
		var cards_to_deselect = selected_cards.duplicate()
		for card in cards_to_deselect:
			selected_cards.erase(card)
			card.modulate = Color.AZURE
			

func _read_in():
	var feat_text = ""
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
	save()
	if(turn != 26):
		if(check()):
			turn += 1
			get_node("Panel/Def sapce").text = "Good Job"
			score_update(true)
			#for card in selected_cards:
			#`_on_card_toggled_name(card)
			await get_tree().create_timer(3.0).timeout
			deselect_all()
			_read_in()
		else:
			get_node("Panel/Def sapce").text = "Try Again"
			score_update(false)
			await get_tree().create_timer(3.0).timeout
			deselect_all()
			_read_in()
	else:
		get_node("Panel/Def sapce").text = "Great Job! \n You Scored: " + score;
		await get_tree().create_timer(3.0).timeout
		get_tree().change_scene_to_file('')
	


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Missions/mission_2/wiw/wiw_demo.tscn")
