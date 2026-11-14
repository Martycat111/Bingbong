extends Node2D


var time_between_spawns = 2
var time_since_spawn = 0

var obstacle_scene = load("res://Scenes/Obstacle.tscn")

var player_scene = load("res://Scenes/Player.tscn")

@onready var top_obstacles = get_node("top")
@onready var bottom_obstacles = get_node("bottom")


func _ready() -> void:
	var instance = player_scene.instantiate()
	self.add_child(instance)


func spawn():
	time_between_spawns -= 0.05
	var instance = obstacle_scene.instantiate()
	if randf_range(0, 1) > 0.5:
		top_obstacles.add_child(instance)
		instance.rotation = deg_to_rad(180)
	else:
		bottom_obstacles.add_child(instance)

func _process(delta: float) -> void:
	time_since_spawn += delta
	if time_since_spawn > time_between_spawns *  1 - (Globals.speed_multiplier - 1): # bro what
		time_since_spawn = 0
		spawn()
