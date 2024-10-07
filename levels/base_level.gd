class_name BaseLevel extends Node

signal rats_total_changed
signal on_player_life_changed(life: int)

var player_scene: PackedScene = preload("res://scenes/player/player.tscn")

var spawn_position := Vector2.ZERO
var current_player_node: CharacterBody2D = null
var total_rats := 0
var collected_rats := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_position = $Player.global_position
	total_rats_changed(get_tree().get_nodes_in_group("Rat").size())
	

func register_player(player: CharacterBody2D) -> void:
	current_player_node = player


func rat_catched() -> void:
	collected_rats += 1
	rats_total_changed.emit(total_rats, collected_rats)
	

func total_rats_changed(new_total: int) -> void:
	total_rats = new_total
	emit_signal("rats_total_changed", total_rats, collected_rats)


func update_lives(lives: int) -> void:
	emit_signal("on_player_life_changed", lives)
