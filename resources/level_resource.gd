extends Resource
class_name LevelResource

@export var total_rats: int
@export var collected_rats: int


func _init(p_total_rats = 0, p_collected_rats = 0) -> void:
	total_rats = p_total_rats
	collected_rats = p_collected_rats
