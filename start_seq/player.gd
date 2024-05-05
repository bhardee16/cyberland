extends Node

var player = Player.new(TextEdit)
# Define a class to hold player information
class Player:
	var name
	#var file
	
	func _init(name):
		self.name = name
		
	# Function to save player data to a file
	#func save_player_data(name):
		#var file = File.new()
		#file.open("user://player_data.sav", File.WRITE)
		#file.store_var(player_data)
		#file.close()
		
	# Function to load player data from a file
	#func load_player_data():
		#var player_data = null
		#var file = File.new()
		#if file.file_exists("user://player_data.sav"):
			#file.open("user://player_data.sav", File.READ)
			#player_data = file.get_var()
			#file.close()
		#return player_data

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_start_pressed():
	#player = TextEdit
	get_tree().change_scene_to_file("res://main_menu.tscn")
