class_name Speedy extends CharacterBody2D

signal boss_catched

@onready var sprite_2d: Sprite2D = $Sprite2D


func _ready() -> void:
	$CatchBox.connect("area_entered", _on_catch_box_entered)


func _physics_process(_delta: float) -> void:
	move_and_slide()
	
	if velocity.x < 0:
		sprite_2d.flip_h = true
	else:
		sprite_2d.flip_h = false	


func _on_catch_box_entered(_area: Area2D) -> void:
	if _area.is_in_group("Player"):
		$AnimationPlayer.play("pickup")
		call_deferred("disable_pickup")
		call_deferred("disable_hazard")
		var base_level = get_tree().get_first_node_in_group("base_level")
		if base_level == null:
			return
		
		base_level.rat_catched()
		emit_signal("boss_catched")


func disable_pickup() -> void:
	$CatchBox/CollisionShape2D.disabled = true


func disable_hazard() -> void:
	$HazardBox/CollisionShape2D.disabled = true
