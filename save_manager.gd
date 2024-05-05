extends Node

var json = JSON.new()
var path = "user://data.json"

var data = {}

func write_save(content):
	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_string(JSON.stringify(content))
	file.close()
	file = null
	
func read_save():
	var file = FileAccess.open(path, FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	return content
	
func create_new_save_file():
	var file = FileAccess.open("res://save.json", FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	data = content
	write_save(content)
	
func _ready():
	if FileAccess.file_exists("user://data.json"):
		data = read_save()
	else:
		create_new_save_file()
