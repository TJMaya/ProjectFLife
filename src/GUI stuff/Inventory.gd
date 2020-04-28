extends Control
var inv = false
onready var itemList = get_node("brownback/Panel/ItemList")

func _ready():
	itemList.set_max_columns(9)
	itemList.set_fixed_icon_size(Vector2(48, 48))
	itemList.set_icon_mode(ItemList.ICON_MODE_TOP)
	itemList.set_select_mode(ItemList.SELECT_SINGLE)
	itemList.set_same_column_width(true)

func _input(event):
	if Input.is_key_pressed(KEY_I) and inv == false:
		get_node(".").show()
		inv = true
		get_tree().paused = not get_tree().paused
		
	elif Input.is_key_pressed(KEY_I) and inv == true:
		get_node(".").hide()
		inv = false
		get_tree().paused = not get_tree().paused
		


func _on_Button_pressed():
	get_tree().quit()
