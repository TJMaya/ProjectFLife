extends Node2D

var icon = ResourceLoader.load("res://assets/sprites/icon.png")
onready var itemList = get_parent().get_node("GameUI/Inventory/brownback/Panel/ItemList")
func _ready():
	pass
	
func _on_PlayerDetector_area_entered(area):
	itemList.add_item("", icon, true)
	queue_free()
