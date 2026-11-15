extends Label

func round_to_dec(num, digit):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Globals.score > Globals.highscore:
		Globals.highscore = Globals.score
	set_text("highscore: " + str(round_to_dec(Globals.highscore, 1)))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
