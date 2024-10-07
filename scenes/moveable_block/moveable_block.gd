extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var button: ButtonCustom = get_tree().get_first_node_in_group("Button")
	if button:
		button.activated_button.connect(_on_activated)


func _on_activated() -> void:
	$AnimatedSprite2D.play("move")
	call_deferred("disable_collision")


func disable_collision() -> void:
	$CollisionShape2D.disabled = true
