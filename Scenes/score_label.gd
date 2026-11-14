extends Label

func round_to_dec(num, digit):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_text("your score: " + str(round_to_dec(Globals.score, 1)))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
