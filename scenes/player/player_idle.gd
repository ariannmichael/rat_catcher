class_name PlayerIdle extends State

@export var player: Player

func enter() -> void:
	player.update_animator("idle")


func update(_delta: float) -> void:
	if player.input != Vector2.ZERO:
		_transitioned.emit(self, "walk")
	
	player.velocity = Vector2.ZERO
