extends CanvasLayer


func _on_button_pressed() -> void:
	$"/root/LevelManager".increment_level()
