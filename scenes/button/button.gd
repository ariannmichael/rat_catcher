extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _on_area_entered(area: Area2D) -> void:
	animated_sprite_2d.play("pressed")
