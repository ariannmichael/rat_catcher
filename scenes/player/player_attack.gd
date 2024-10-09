class_name PlayerAttack extends State

@export_range(1, 20, 0.5) var decelerate_speed := 5.0
@export var player: Player

@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var attack_animation_player: AnimationPlayer = $"../../AnimatedSprite2D/AttackEffectSprite/AttackAnimationPlayer"
@onready var attack_effect_sprite: Sprite2D = $"../../AnimatedSprite2D/AttackEffectSprite"
@onready var catch_collision: CollisionShape2D = $"../../CatchBox/CollisionShape2D"
@onready var hazard_collision: CollisionShape2D = $"../../HazardArea/CollisionShape2D"
@onready var catch_box: Area2D = $"../../CatchBox"
@onready var catch_right: Marker2D = $"../../Catch_Right"
@onready var catch_left: Marker2D = $"../../Catch_Left"
@onready var catch_down: Marker2D = $"../../Catch_Down"
@onready var catch_up: Marker2D = $"../../Catch_Up"
@onready var catch_sfx: AudioStreamPlayer = $"../../Catch"


var attacking := false


func enter() -> void:
	catch_sfx.play()
	player.update_animator("attack")
	attack_animation_player.play("attack_" + player.anim_direction())
	update_catch_box_position()
	
	attacking = true
	hazard_collision.set_deferred("disabled", true)
	catch_collision.set_deferred("disabled", false)


func exit() -> void:
	attacking = false
	hazard_collision.set_deferred("disabled", false)
	catch_collision.set_deferred("disabled", true)


func update(_delta: float) -> void:
	player.velocity -= player.velocity * decelerate_speed * _delta
	
	if attacking == false:
		if player.input == Vector2.ZERO:
			_transitioned.emit(self, "idle")
		else:
			_transitioned.emit(self, "walk")
			

func _on_attack_animation_player_animation_finished(_anim_name: StringName) -> void:
	attacking = false
	hazard_collision.set_deferred("disabled", false)
	catch_collision.set_deferred("disabled", true)


func update_catch_box_position() -> void:
	var new_catch_position = get_catch_position()
	catch_box.position = new_catch_position.position
	catch_box.rotation = new_catch_position.rotation


func get_catch_position() -> Marker2D:
	match player.direction:
		Vector2.RIGHT:
			return catch_right
		Vector2.LEFT:
			return catch_left
		Vector2.DOWN:
			return catch_down
		_:
			return catch_up
