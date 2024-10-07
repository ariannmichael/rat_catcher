extends Node

@export var level_scenes: Array[PackedScene]

var current_index_level := 0


func change_level(level_index: int) -> void:
	current_index_level = level_index
	if current_index_level >= level_scenes.size():
		current_index_level = 0
		
	call_deferred("update_scene")
	

func increment_level() -> void:
	change_level(current_index_level + 1)


func decrement_level() -> void:
	change_level(current_index_level - 1)


func update_scene() -> void:
	get_tree().change_scene_to_packed(level_scenes[current_index_level])


func gameover_scene() -> void:
	change_level(-1)
