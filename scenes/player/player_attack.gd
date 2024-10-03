class_name PlayerAttack extends State

@export_range(1, 20, 0.5) var decelerate_speed := 5.0
@export var player: Player

@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var attack_animation_player: AnimationPlayer = $"../../AnimatedSprite2D/AttackEffectSprite/AttackAnimationPlayer"
@onready var attack_effect_sprite: Sprite2D = $"../../AnimatedSprite2D/AttackEffectSprite"
@onready var catch_collision: CollisionShape2D = $"../../CatchBox/CollisionShape2D"
@onready var hazard_collision: CollisionShape2D = $"../../HazardArea/CollisionShape2D"


var attacking := false


func enter() -> void:
	player.update_animator("attack")
	attack_animation_player.play("attack_" + player.anim_direction())

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
			

func _on_attack_animation_player_animation_finished(anim_name: StringName) -> void:
	attacking = false
	hazard_collision.set_deferred("disabled", false)
	catch_collision.set_deferred("disabled", true)
