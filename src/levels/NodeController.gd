extends Node2D

onready var nav_2d: Navigation2D = $Navigation2D
onready var player: KinematicBody2D = $Player
onready var enemy: KinematicBody2D = $Enemy
onready var enemy2: KinematicBody2D = $Enemy2
onready var hp = get_node("GameUI/HealthUI/HealthBar")

func _physics_process(_delta):
	for enemy in get_tree().get_nodes_in_group("enemy"):
		var new_path := nav_2d.get_simple_path(enemy.global_position, player.global_position)
		enemy.path = new_path
	hp._on_health_updated(player.health)
