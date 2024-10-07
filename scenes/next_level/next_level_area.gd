extends Area2D

@onready var next_level_area: Area2D = $"."


func _ready() -> void:
	var base_level = get_tree().get_first_node_in_group("base_level")
	if base_level:
		base_level.connect("all_rats_collected", _on_all_rats_collected)
	

func _on_area_entered(_area: Area2D) -> void:
	$"/root/LevelManager".increment_level()


func _on_all_rats_collected() -> void:
	call_deferred("enable_stair")


func enable_stair() -> void:
	self.visible = true
