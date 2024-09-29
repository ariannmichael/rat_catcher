extends Node

signal rats_total_changed

var player_scene: PackedScene = preload("res://scenes/player/player.tscn")

var spawn_position := Vector2.ZERO
var current_player_node: CharacterBody2D = null
var total_rats := 0
var collected_rats := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_position = $Player.global_position
	total_rats_changed(get_tree().get_nodes_in_group("Rat").size())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func register_player(player: CharacterBody2D) -> void:
	current_player_node = player
	

func total_rats_changed(new_total: int) -> void:
	total_rats = new_total
	emit_signal("rats_total_changed", total_rats, collected_rats)
