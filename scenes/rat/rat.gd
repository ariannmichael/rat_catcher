class_name Rat extends CharacterBody2D

@export var move_speed := 10

var move_direction: Vector2
var wander_time: float


func _ready() -> void:
	randomize_wander()


func _process(delta: float) -> void:
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander()


func _physics_process(_delta: float) -> void:
	velocity = move_direction * move_speed
	move_and_slide()


func randomize_wander() -> void:
	move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	wander_time = randf_range(1, 3)
