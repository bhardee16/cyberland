extends Node
var selected_cards = [];
var turn = 0;

var resources = {
			0 :{
				"name": "facebook",
				"desc": "This is facebook",
				"cards": [&"Cyber Bullying"],
				"feats": [""]
				},
			1 :{
				"name": "facebook",
				"desc": "",
				"cards": [],
				"feats": [""]
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
	print(card)
	if card:
		if !selected_cards.has(card.name):
			selected_cards.append(card.name)
			print(selected_cards)
			card.modulate = Color.GREEN
		else:
			selected_cards.erase(card.name)
			print(selected_cards)
			card.modulate = Color.AZURE
			
#func _on_card_toggled_name(name):
	#if name:
		#if selected_cards.has(name):
			#get_node(name).modulate = Color.AZURE
			
			

func _read_in():
	get_node("Panel/Def sapce").text = resources[turn].name + "\n" + resources[turn].desc + "\n" #add features


func _on_done_pressed():
	if(selected_cards == resources[turn].cards):
		turn += 1
		get_node("Panel/Def sapce").text = "Good Job"
		#for card in selected_cards:
		#`_on_card_toggled_name(card)
		await get_tree().create_timer(3.0).timeout
		_read_in()
	else:
		get_node("Panel/Def sapce").text = "Try Again"
		await get_tree().create_timer(3.0).timeout
		_read_in()
