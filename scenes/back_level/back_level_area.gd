extends Area2D


func _on_area_entered(area: Area2D) -> void:
	$"/root/LevelManager".decrement_level()
