extends Control
var inv = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _input(event):
	if Input.is_key_pressed(KEY_I) and inv == false:
		get_node(".").hide()
		get_node("ParallaxBackground/ParallaxLayer/brownback").hide()
		inv = true
	elif Input.is_key_pressed(KEY_I) and inv == true:
		get_node(".").show()
		get_node("ParallaxBackground/ParallaxLayer/brownback").show()
		inv = false
	pass # Replace with function body.
