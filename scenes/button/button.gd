class_name ButtonCustom extends Area2D

signal activated_button

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func _on_area_entered(_area: Area2D) -> void:
	animated_sprite_2d.play("pressed")
	activated_button.emit()
	audio_stream_player.play()
