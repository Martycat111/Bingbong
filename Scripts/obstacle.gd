extends StaticBody2D

var is_upside_down = false

@onready var type = self.get_parent().get_parent().name

var speed = 200

func _ready() -> void:
	if type == "top":
		is_upside_down = true
	if type == "bottom":
		is_upside_down = false


func _process(delta: float) -> void:
	if !Globals.reversed:
		if is_upside_down:
			self.position.x += delta * speed * Globals.speed_multiplier
		else:
			self.position.x -= delta * speed * Globals.speed_multiplier
		if position.x > 1200:
			queue_free()
	if Globals.reversed:
		if is_upside_down:
			self.position.x -= delta * speed * Globals.speed_multiplier
		else:
			self.position.x += delta * speed * Globals.speed_multiplier
	if abs(position.x) > 3000:
		queue_free()
