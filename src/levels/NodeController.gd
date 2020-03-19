extends Node2D

onready var nav_2d: Navigation2D = $Navigation2D
onready var player: KinematicBody2D = $Player
onready var enemy: KinematicBody2D = $Enemy

func _physics_process(_delta):
	var new_path := nav_2d.get_simple_path(enemy.global_position, player.global_position)
	enemy.path = new_path

