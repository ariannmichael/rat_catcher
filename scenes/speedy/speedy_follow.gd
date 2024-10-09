class_name SpeedyFollow extends State

@export_range(1, 20, 0.5) var decelerate_speed := 5.0
@export var enemy: Speedy
@export var move_speed := 200.0
@export var push_back_force: float = 60.0

var player: Player
var direction: Vector2


func enter() -> void:
	player = get_tree().get_first_node_in_group("Player")


func physics_update(_delta) -> void:
	if !player:
		return
	
	direction = player.global_position - enemy.global_position
	
	if direction.length() > 10:
		enemy.velocity = direction.normalized() * move_speed * -1
	else:
		enemy.velocity = Vector2()
	
	if direction.length() > 50:
		_transitioned.emit(self, "wander")


func _on_collision_box_area_entered(area: Area2D) -> void:
	enemy.global_position += direction * push_back_force * -1
	enemy.velocity -= enemy.velocity * decelerate_speed
	_transitioned.emit(self, "wander")
