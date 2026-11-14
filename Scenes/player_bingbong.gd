extends CharacterBody2D

@export var speed = 4000
var screen_side

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotation = PI
	rotation_degrees = 0


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("rotate clockwise"):
		#self.rotate_degrees(45)
		self.rotation_degrees -= 5
	if Input.is_action_pressed("rotate counterclockwise"):
		self.rotation_degrees += 5
	if Input.is_action_pressed("shoot"):
		velocity = Vector2(1, 0).rotated(rotation) * (speed * 10) * delta
	if velocity.x > 0:
		velocity.x -= 500 * delta
	if velocity.y > 0:
		velocity.y -= 500 * delta
	if velocity.x < 0:
		velocity.x += 500 * delta
	if velocity.y < 0:
		velocity.y += 500 * delta
	move_and_slide()


func offscreen():
	# Player has gone offscreen
	queue_free()
