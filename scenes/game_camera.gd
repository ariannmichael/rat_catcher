extends Camera2D

@export_color_no_alpha var background_color

var target_position := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	RenderingServer.set_default_clear_color(background_color)
	make_current()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
