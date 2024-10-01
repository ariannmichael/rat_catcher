extends CanvasLayer

@export_file("*.json") var d_file

var dialogue = []
var current_dialogue_id = 0
var d_active = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$NinePatchRect.visible = false
	start()


func start():
	if d_active:
		return
	d_active = true
	$NinePatchRect.visible = true
	
	dialogue = load_dialogue()
	current_dialogue_id = -1
	next_script()
	

func load_dialogue():
	var file = FileAccess.open("res://dialogues/json/start_chat.json", FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	return content


func _input(event):
	if not d_active:
		return 
	if event.is_action_pressed("ui_accept"):
		next_script()


func next_script():
	current_dialogue_id += 1
	if current_dialogue_id >= len(dialogue):
		$Timer.start()
		$NinePatchRect.visible = false
		return
		
	$NinePatchRect/Name.text = dialogue[current_dialogue_id]['name']
	$NinePatchRect/Chat.text = dialogue[current_dialogue_id]['text']


func _on_timer_timeout() -> void:
	d_active = false
