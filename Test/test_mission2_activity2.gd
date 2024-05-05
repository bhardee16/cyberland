extends "res://addons/gut/test.gd"

# Load the game logic script
const GameLogic = preload("res://Missions/mission_2/mission2_activity/matching_scenes/Buttons.gd")


func test_is_correct():
	# Arrange
	var game_logic = GameLogic.new()
	game_logic.item = {
		"application": "Application",
		"answers": ["button1", "button2"]
	}

	# Act and Assert
	game_logic.selected = []
	assert_false(game_logic._is_correct(), "Should return false when no answers are selected")

	game_logic.selected = ["button1"]
	assert_false(game_logic._is_correct(), "Should return false when only one correct answer is selected")

	game_logic.selected = ["button1", "button2"]
	assert_true(game_logic._is_correct(), "Should return true when all correct answers are selected")

	game_logic.selected = ["button1", "button2", "button3"]
	assert_false(game_logic._is_correct(), "Should return false when incorrect answers are also selected")

func test_refresh_scene():
	# Arrange
	var game_logic = GameLogic.new()
	var mock_button1 = MockButton.new("button1")
	var mock_button2 = MockButton.new("button2")
	game_logic.selected = [mock_button1, mock_button2]

	# Act
	game_logic._refresh_scene()

	# Assert
	assert_true(game_logic.selected.is_empty(), "Selected buttons should be cleared")
	assert_false(mock_button1.is_pressed, "Button1 should be unselected")
	assert_false(mock_button2.is_pressed, "Button2 should be unselected")

# Mock class for Button
class MockButton:
	var name: String
	var is_pressed: bool = false

	func _init(button_name):
		name = button_name

	func set_pressed(value):
		is_pressed = value

# Run the tests
func run():
	test_is_correct()
	test_refresh_scene()
