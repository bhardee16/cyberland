extends Node
var selected_cards = [];
var turn = 0;
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
			0 :{
				"name": "Social Media Platform",
				#"desc": "This is facebook",
				"cards": ["Cyber Bullying",
					"Defamation",
					"Exposure",
					"Exclusion",
					"Identity Theft",
					"Mobbing Culture",
					"Instigation",
					"Online Deception",
					"Online Harassment"
				],
				"feats": ["Connecting with people you know or don't know",
					"Sharing your opinions",
					"Live streaming",
					"Group chat",
					"Sharing photos/videos",
					"Commenting on posts",
					"Video calling",
					"Content creation"
				]
				},
			1 :{
				"name": "Online Game",
				"cards": ["Cyber Bullying",
					"Defamation",
					"Exposure",
					"Exclusion",
					"Identity Theft",
					"Mobbing Culture",
					"Instigation",
					"Online Deception",
					"Online Harassment"
				],
				"feats": ["Communicating during the game",
					"Participating in tournaments",
					"Forming teams",
					"Creating characters or avatars",
					"Connecting with people you know or don't know"
				]
				},
			2 :{
				"name": "Email Service",
				"cards": ["Cyber Bullying",
					"Defamation",
					"Exposure",
					"Identity Theft",
					"Instigation",
					"Online Deception",
					"Online Harassment"
				],
				"feats": ["Sending/receiving emails",
					"Sending/receiving files",
					"Creating calendar events",
					"Connecting with people you know or don't know"
				]
				},
			3 :{
				"name": "Video Sharing Platform",
				"cards": ["Cyber Bullying",
					"Defamation",
					"Exposure",
					"Exclusion",
					"Identity Theft",
					"Mobbing Culture",
					"Instigation",
					"Online Deception",
					"Online Harassment"
				],
				"feats": ["Sharing videos",
					"Content creation",
					"Commenting",
					"Subscribing to channels",
					"Live streaming",
					"Connecting with people you know or don't know"
				]
				},
			4 :{
				"name": "Online Shopping Application",
				"cards": ["Cyber Bullying",
					"Defamation",
					"Exposure",
					"Identity Theft",
					"Instigation",
					"Online Deception",
					"Online Harassment"
				],
				"feats": ["Online shopping",
					"Reviewing products",
					"Following brands/boutiques",
					"Product/price comparison",
					"Shopping cart",
					"Connecting with people you know or don’t know"
				]
				},
			5 :{
				"name": "Messaging Application",
				"cards": ["Cyber Bullying",
					"Defamation",
					"Exposure",
					"Exclusion",
					"Identity Theft",
					"Mobbing Culture",
					"Instigation",
					"Online Deception",
					"Online Harassment"
				],
				"feats": ["Connecting with people you know or don't know",
					"Individual/group chat",
					"Creating groups",
					"Sending or receiving messages/videos/photos/voice recordings",
					"Video or voice calls"
				]
				}
			}


func _ready():
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
					card.pressed.connect(_on_card_toggled.bind(card))

func _on_card_toggled(card):
	if card:
		if !selected_cards.has(card):
			selected_cards.push_back(card)
			print(selected_cards)
			card.modulate = Color.GREEN
		else:
			selected_cards.erase(card)
			print(selected_cards)
			card.modulate = Color.AZURE
			
func deselect_all():
	if !selected_cards.is_empty():
		var cards_to_deselect = selected_cards.duplicate()
		for card in cards_to_deselect:
			selected_cards.erase(card)
			card.modulate = Color.AZURE
			

func _read_in():
	var feat_text = ""
	for feat in resources[turn].feats:
		feat_text += feat + "\n"
	get_node("Panel/Def sapce").text = resources[turn].name + "\n" + feat_text #add features
	
func check():
	var contains = 0
	if(selected_cards):
		for card in selected_cards:
			if(resources[turn].cards.has(card.name)):
				print(card.name)
				contains += 1
			else:
				return false
		if(contains == len(resources[turn].cards)):
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
