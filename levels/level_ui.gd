extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var base_levels = get_tree().get_nodes_in_group("base_level")
	if base_levels.size() > 0:
		base_levels[0].connect("rats_total_changed", update_rats_count)


func update_rats_count(total_rats: int, collected_rats: int) -> void:
	$MarginContainer/HBoxContainer/Label.text = str(str(collected_rats) + "/" + str(total_rats))
