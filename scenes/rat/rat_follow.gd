class_name RatFollow extends State

@export var enemy: Rat
@export var move_speed := 10.0

var player: Player


func enter() -> void:
	player = get_tree().get_first_node_in_group("Player")


func physics_update(_delta) -> void:
	if !player:
		return
	
	var direction = player.global_position - enemy.global_position
	
	if direction.length() > 10:
		enemy.velocity = direction.normalized() * move_speed
	else:
		enemy.velocity = Vector2()
	
	if direction.length() > 50:
		_transitioned.emit(self, "wander")
