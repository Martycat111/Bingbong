extends Node2D


var time_between_spawns = 2
var time_since_spawn = 0

var time_between_speedups = 1
var time_since_speedup = 0

var obstacle_scene = load("res://Scenes/Obstacle.tscn")
var obstacle2_scene = load("res://Scenes/Obstacle2.tscn")


var player_scene = load("res://Scenes/Player.tscn")

var time = 0

var reverse_time = time + randi_range(5, 20)

@onready var top_obstacles = get_node("top")
@onready var bottom_obstacles = get_node("bottom")


func _ready() -> void:
	var instance = player_scene.instantiate()
	self.add_child(instance)

func reverse():
	reverse_time = time + randi_range(5, 20)
	Globals.reversed = !Globals.reversed

func spawn():
	var chance = randf_range(0, 1)
	var instance = obstacle_scene.instantiate()
	if chance > 0.5:
		instance = obstacle2_scene.instantiate()
	if randf_range(0, 1) > 0.5:
		top_obstacles.add_child(instance)
		instance.rotation = deg_to_rad(180)
	else:
		bottom_obstacles.add_child(instance)

func _process(delta: float) -> void:
	time += delta
	time_since_spawn += delta * 200 * Globals.speed_multiplier
	time_since_speedup += delta
	if time_since_spawn > 400:
		time_since_spawn = 0
		spawn()
	if time > reverse_time:
		reverse()
	if time_since_speedup > time_between_speedups:
		time_since_speedup = 0
		Globals.speed_multiplier += 0.1


func _on_play_body_exited(body: Node2D) -> void:
	if body.name == "PlayerBingbong":
		body.offscreen()
		get_tree().change_scene_to_file("res://Scenes/Score.tscn")
