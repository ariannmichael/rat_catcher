class_name Player extends CharacterBody2D

signal died

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var direction := Vector2.DOWN
var input := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	input = Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	).normalized()


func _physics_process(_delta: float) -> void:
	move_and_slide()


func set_direction() -> bool:
	var new_direction: Vector2 = direction
	
	if input == Vector2.ZERO:
		return false
	
	if input.y == 0:
		new_direction = Vector2.LEFT if input.x < 0 else Vector2.RIGHT
	elif input.x == 0:
		new_direction = Vector2.UP if input.y < 0 else Vector2.DOWN
	
	if direction == new_direction:
		return false
	
	direction = new_direction
	sprite.scale.x = 1 if direction == Vector2.LEFT else -1
	return true


func update_animator(state: String) -> void:
	if sprite:
		sprite.play(state + "_" + anim_direction())


func anim_direction() -> String:
	if direction == Vector2.UP:
		return "up"
	elif direction == Vector2.DOWN:
		return "down"
	else:
		return "side"


func _on_hazard_area_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
