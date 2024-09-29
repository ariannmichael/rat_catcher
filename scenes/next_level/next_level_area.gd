extends Area2D

@onready var next_level_area: Area2D = $"."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#next_level_area.connect("area_entered", on_next_level)


#func on_next_level() -> void:
	#print("on_next_level")
	#$"/root/LevelManager".increment_level()


func _on_area_entered(area: Area2D) -> void:
	print("on_next_level")
	$"/root/LevelManager".increment_level()
