extends Control

onready var health_over = $HealthBarOver
onready var health_under = $HealthBarUnder
onready var update_tween = $UpdateTween

func _ready():
	_on_max_health_updated(100)

func _on_health_updated(health):
	health_over.value = health
	update_tween.interpolate_property(health_under, "value", health_over.value, health, 0.4, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0.4)
	update_tween.start()
	
func _on_max_health_updated(max_health):
	health_over.max_value = max_health
	health_under.max_value = max_health
