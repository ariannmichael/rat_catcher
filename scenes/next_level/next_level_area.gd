extends Area2D

@onready var next_level_area: Area2D = $"."


func _on_area_entered(_area: Area2D) -> void:
	$"/root/LevelManager".increment_level()
