extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"/root/LevelManager".change_level(0)
	
