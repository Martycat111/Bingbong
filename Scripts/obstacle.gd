extends Sprite2D

var is_upside_down = false

@onready var type = self.get_parent().get_parent().name

func _ready() -> void:
	if type == "top":
		is_upside_down = true
	if type == "bottom":
		is_upside_down = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_upside_down:
		self.position.x += delta * 100 * Globals.speed_multiplier
	else:
		self.position.x -= delta * 100 * Globals.speed_multiplier
