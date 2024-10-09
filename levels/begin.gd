extends Node

@onready var path_follow_2d: PathFollow2D = $Path2D/PathFollow2D
@onready var player_path_follow: PathFollow2D = $PlayerPath/PlayerPathFollow
@onready var player: AnimatedSprite2D = $PlayerPath/PlayerPathFollow/Player



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if path_follow_2d.progress_ratio < 0.95:
		path_follow_2d.progress_ratio += 0.002 
	else:
		call_deferred("player_scene")


func player_scene() -> void:
	if player:
		player.visible = true
		
		if player_path_follow.progress_ratio < 0.95:
			player_path_follow.progress_ratio += 0.002
		else:
			$"/root/LevelManager".increment_level()
