extends CanvasLayer

var p_life_icon: PackedScene = preload("res://scenes/life_icon/life_icon.tscn")

@onready var life_container: HBoxContainer = $MarginContainer/LifeContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	clear_lives()
	
	var base_levels = get_tree().get_nodes_in_group("base_level")
	if base_levels.size() > 0:
		base_levels[0].connect("rats_total_changed", update_rats_count)
		base_levels[0].connect("on_player_life_changed", _on_player_life_changed)


func update_rats_count(total_rats: int, collected_rats: int) -> void:
	$MarginContainer/CounterContainer/Label.text = str(str(collected_rats) + "/" + str(total_rats))


func clear_lives() -> void:
	for child in life_container.get_children():
		child.queue_free()


func set_lives(lives: int) -> void:
	clear_lives()
	for _i in range(lives):
		life_container.add_child(p_life_icon.instantiate())


func _on_player_life_changed(life: int) -> void:
	set_lives(life)
