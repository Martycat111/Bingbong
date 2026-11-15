extends CharacterBody2D

@export var speed = 4000
var time_since_shoot = 0
var time_between_shoot = 0.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotation = PI
	rotation_degrees = 0


func _physics_process(delta: float) -> void:
	time_since_shoot += delta
	if Input.is_action_pressed("rotate clockwise"):
		#self.rotate_degrees(45)
		self.rotation_degrees -= 5
	if Input.is_action_pressed("rotate counterclockwise"):
		self.rotation_degrees += 5
	if Input.is_action_pressed("shoot") and time_since_shoot > time_between_shoot:
		time_since_shoot = 0
		velocity = Vector2(1, 0).rotated(rotation) * (speed * 10) * delta
	
	# Drag
	if velocity.x > 0:
		velocity.x -= 500 * delta
	if velocity.y > 0:
		velocity.y -= 500 * delta
	if velocity.x < 0:
		velocity.x += 500 * delta
	if velocity.y < 0:
		velocity.y += 500 * delta
	
	# Move slowly offscreen to prevent sitting there
	if !Globals.reversed:
		velocity.x -= 10
	else:
		velocity.x += 10
	move_and_slide()


func offscreen():
	# Player has gone offscreen
	queue_free()
