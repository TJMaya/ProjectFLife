extends Node2D


func _ready():
	pass
	
func _on_PlayerDetector_area_entered(area):
	queue_free()
