extends CanvasLayer

func _ready():
	if get_node("Inventory").is_visible():
		get_node("HealthBar").hide()
	else:
		get_node("HealthBar").show()
