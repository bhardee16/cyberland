extends "res://addons/gut/test.gd"

# Reference to the main script
var main_script: Node

func _ready():
	# Get a reference to the main script
	main_script = load("res://Missions/mission_2/wiw/wiw_play.gd").new()
	
	# Run the test cases
	test_deselect_all()
	test_check()
	test_score_update()
	test_turn_handling()

func test_deselect_all():
	# Set up test data
	var card1 = Button.new()
	var card2 = Button.new()
	main_script.selected_cards = [card1, card2]
	
	# Call the function under test
	main_script.deselect_all()
	
	# Assert the expected results
	assert(main_script.selected_cards.is_empty())
	assert(card1.modulate == Color.AZURE)
	assert(card2.modulate == Color.AZURE)
	
	print("test_deselect_all passed")

func test_check():
	# Set up test data
	var card1 = Button.new()
	card1.name = "Identity Theft"
	main_script.selected_cards = [card1]
	main_script.turn = 4
	
	# Call the function under test
	var result = main_script.check()
	
	# Assert the expected result
	assert(result == true)
	
	print("test_check passed")

func test_score_update():
	# Set up test data
	main_script.score = 5
	
	# Call the function under test
	main_script.score_update(true)
	assert(main_script.score == 6)
	
	main_script.score_update(false)
	assert(main_script.score == 5)
	
	print("test_score_update passed")

func test_turn_handling():
	# Set up test data
	main_script.turn = 25
	
	# Call the function under test
	main_script._on_done_pressed()
	
	# Assert the expected result
	assert(main_script.turn == 26)
	
	print("test_turn_handling passed")
