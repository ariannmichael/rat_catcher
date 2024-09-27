class_name PlayerWalk extends State

@export var player: Player

@export var move_speed: float = 100.0

func enter() -> void:
	player.update_animator("walk")


func update(_delta) -> void:
	if player.input == Vector2.ZERO:
		_transitioned.emit(self, "idle")
		
	player.velocity = move_speed * player.input
	
	if player.set_direction():
		player.update_animator("walk")
