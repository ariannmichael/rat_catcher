class_name RatWander extends State

@export var enemy: Rat
@export var move_speed := 10.0

var move_direction: Vector2
var wander_time: float
var player: CharacterBody2D

func enter() -> void:
	player = get_tree().get_first_node_in_group("Player")
	randomize_wander()


func update(_delta: float) -> void:
	if wander_time > 0:
		wander_time -= _delta
	else:
		randomize_wander()


func physics_update(_delta: float) -> void:
	if enemy:
		enemy.velocity = move_direction * move_speed
	
	var direction = player.global_position - enemy.global_position
	
	if direction.length() < 30:
		_transitioned.emit(self, "follow")


func randomize_wander() -> void:
	move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	wander_time = randf_range(1, 3)
