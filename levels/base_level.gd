class_name BaseLevel extends Node

signal rats_total_changed
signal all_rats_collected
signal on_player_life_changed(life: int)

var player_scene: PackedScene = preload("res://scenes/player/player.tscn")

@export var level_resource: Resource

var spawn_position := Vector2.ZERO
var current_player_node: CharacterBody2D = null
var total_rats := 0
var collected_rats := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_position = $Player.global_position
	var rats: int = get_tree().get_nodes_in_group("Rat").size()
	
	if level_resource:
		level_resource.total_rats = rats
		collected_rats = level_resource.collected_rats
		
	total_rats_changed(rats)
	
	var player = get_tree().get_first_node_in_group("Player")
	if player:
		player.connect("died", _on_player_died)
	

func register_player(player: CharacterBody2D) -> void:
	current_player_node = player


func rat_catched() -> void:
	collected_rats += 1
	rats_total_changed.emit(total_rats, collected_rats)
	level_resource.collected_rats = collected_rats
	if collected_rats == total_rats:
		all_rats_collected.emit()
	

func total_rats_changed(new_total: int) -> void:
	total_rats = new_total
	emit_signal("rats_total_changed", total_rats, collected_rats)
	update_rats()


func update_rats() -> void:
	var rats = get_tree().get_nodes_in_group("Rat")
	for i in range(len(rats)):
		if i < collected_rats:
			rats[i].queue_free()
		
	if total_rats == collected_rats:
		emit_signal("all_rats_collected")


func update_lives(lives: int) -> void:
	emit_signal("on_player_life_changed", lives)


func _on_player_died() -> void:
	$"/root/LevelManager".gameover_scene()
