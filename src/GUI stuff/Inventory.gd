extends Control
var inv = false

func _ready():
	pass 

func _input(event):
	if Input.is_key_pressed(KEY_I) and inv == false:
		get_node(".").show()
		inv = true
		get_tree().paused = not get_tree().paused
		
	elif Input.is_key_pressed(KEY_I) and inv == true:
		get_node(".").hide()
		inv = false
		get_tree().paused = not get_tree().paused
		
