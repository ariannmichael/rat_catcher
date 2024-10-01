class_name PlayerAttack extends State

@export_range(1, 20, 0.5) var decelerate_speed := 5.0
@export var player: Player

@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var attack_animation_player: AnimationPlayer = $"../../AnimatedSprite2D/AttackEffectSprite/AttackAnimationPlayer"


var attacking := false


func enter() -> void:
	player.update_animator("attack")
	attack_animation_player.play("attack_" + player.anim_direction())
		
	animated_sprite_2d.animation_finished.connect(end_attack)
	
	attacking = true


func exit() -> void:
	animated_sprite_2d.animation_finished.disconnect(end_attack)
	attacking = false


func update(_delta: float) -> void:
	player.velocity -= player.velocity * decelerate_speed * _delta
	
	if attacking == false:
		if player.input == Vector2.ZERO:
			_transitioned.emit(self, "idle")
		else:
			_transitioned.emit(self, "walk")
			


func end_attack(_new_anim_name: String) -> void:
	print("false")
	attacking = false
