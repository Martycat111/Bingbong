extends CharacterBody2D

@export var speed = 400 
var screen_side

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotation = PI
	rotation_degrees = 0

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("rotate clockwise"):
		self.rotate(-1)
	if event.is_action_pressed("rotate counterclockwise"):
		self.rotate(1)

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("shoot"):
		position.x += 10 * rotation/(2*PI)
		position.y += 10 * (2*PI) - rotation*(2*PI)
	velocity = Vector2(1, 0).rotated(rotation) * speed * delta
	move_and_slide()
