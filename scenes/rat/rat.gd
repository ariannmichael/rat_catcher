class_name Rat extends CharacterBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D


func _physics_process(_delta: float) -> void:
	move_and_slide()
	
	if velocity.x < 0:
		sprite_2d.flip_h = true
	else:
		sprite_2d.flip_h = false
		


func _on_hurt_box_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
