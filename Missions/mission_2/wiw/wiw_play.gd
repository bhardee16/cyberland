extends Node
var selected_cards = [];
var turn = 1;
var score = 0;
var correct = ["Good Job!", "Amazing!", "Wow, nice job!", "Quick thinking!", "You're great at this! :)"]
var incorrect = ["Try again :(", "Almsot got it, let's try again", "So close!", "You got it next time!"]

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
	var save_data = save_manager.read_save() # Read in saved data and loads score and turn.
	if save_data:
		var parsed_data = JSON.parse_string(save_data)
		if typeof(parsed_data) == TYPE_DICTIONARY:
			if int(parsed_data.turn > 25):
				turn = 1
				score = 0
			else:
				turn = int(parsed_data.turn)
				score = int(parsed_data.score)
				get_node("Sprite2D/Score").text = str(score)
		else:
			# Handle the case where the data is not in the expected format
			print("Error: Saved data is not in the expected format")
	
	var hbox_containers = [
		get_node("VBoxContainer/HBoxContainer"),
		get_node("VBoxContainer/HBoxContainer2"),
		get_node("VBoxContainer/HBoxContainer3")
	]
	
	_read_in()
	
	for hbox in hbox_containers: # creates event handelers for each button
		if hbox:
			for card in hbox.get_children():
				if card is Button:
					card.pressed.connect(_on_card_pressed.bind(card))


# _on_card_pressed adds the card to an array. If the card is pressed again, it is removed. 
# If another card is pressed, the initial card is removed and the current card is added to the array.
func _on_card_pressed(card):
	if !selected_cards.has(card):
		# We only want one card able to be selected at a time, so we deselect all other cards
		deselect_all()
		selected_cards.append(card);
		# Change the card color upon being selected so the user knows which card they clicked
		card.modulate = Color.GREEN
	else:
		deselect_all()
		selected_cards.clear()

# deselect_all removes the green and clears the card array.
func deselect_all():
	if !selected_cards.is_empty():
		var cards_to_deselect = selected_cards.duplicate()
		selected_cards.clear()
		for card in cards_to_deselect:
			card.modulate = Color.AZURE
			

# _read_in sets the def space to the approiate example for the current turn.
func _read_in():
	if(turn != 26):
		get_node("Panel/Def sapce").text = resources[turn].example
	
# check compares the card selected to the answer of the question at a specific turn, if it is right, it returns true, and if it is wrong it returns false.
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

# score_update updates the score variable and changes the score label to the updated score.
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

# _on_done_pressed is an event handler for the done button, but also the driving force of our game. Nothing happens unless the done button is pressed.
func _on_done_pressed():
	if(check()):
		turn += 1
		get_node("Panel/Def sapce").text = correct[randi_range(0, 4)]
		score_update(true)
		await get_tree().create_timer(2.0).timeout
		deselect_all()
		_read_in()
		if(turn == 26): # this determines if the game is over. If turn == 26, the game is finished.
			get_node("Panel/Def sapce").text = "Great Job! \n You Scored: " + str(score)
			await get_tree().create_timer(3.0).timeout
			get_node("Sprite2D/Done").visible = false
			get_node("Sprite2D/Next Game").visible = true
			get_node("Sprite2D/Exit").visible = true
	else:
		get_node("Panel/Def sapce").text = incorrect[randi_range(0,3)]
		score_update(false)
		await get_tree().create_timer(2.0).timeout
		deselect_all()
		_read_in()
	save_manager.write_save(JSON.stringify({'turn':  turn, 'score': score}))
	

# _on_back_pressed is an event handler that allows the user to go back to the definition screen.
func _on_back_pressed():
	get_tree().change_scene_to_file("res://Missions/mission_2/wiw/wiw_demo.tscn")
	



func _on_next_game_pressed():
	get_tree().change_scene_to_file("res://Missions/mission_2/mission2_activity/activity_start.tscn")
	



func _on_exit_pressed():
	get_tree().change_scene_to_file("res://cyberland_map.tscn")
