extends Control
var pause = false

func _ready():
	pass 

func _input(event):
	if event.is_action_pressed("ui_cancel") and pause == false:
		get_node(".").show()
		pause = true
		get_tree().paused = not get_tree().paused
		
	elif event.is_action_pressed("ui_cancel") and pause == true:
		get_node(".").hide()
		pause = false
		get_tree().paused = not get_tree().paused

func _on_Button_pressed():
	get_node(".").hide()
	get_tree().paused = not get_tree().paused
	pause = false

func _on_Button2_pressed():
	get_tree().quit()
