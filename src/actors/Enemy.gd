extends Actor

var path: = PoolVector2Array() setget set_path
var knock_back: = false
export var follow_distance: = 300.0
export var kb_force: = 10.0
export var kb_distance: = 80.0

func _ready() -> void:
	set_physics_process(false)
	$HealthBar.hide()

func _physics_process(delta: float) -> void:
	var move_distance: = speed.x * delta
	
	if follow_distance >= global_position.distance_to(get_parent().get_node("Player").global_position) and knock_back == false:
		move_along_path(move_distance)
	elif knock_back == true:
		move_and_slide(calculate_kb_velocity())
		if global_position.distance_to(get_parent().get_node("Player").global_position) >= kb_distance:
			speed.x = 100
			knock_back = false
	else:
		move_and_slide(_velocity)
		
	check_death()

func _on_AttackDetector_area_entered(area):
	speed.x = -100
	health -= 20.0
	knock_back = true
	get_node("HealthBar")._on_health_updated(health)
	$HealthBar.show()

func calculate_kb_velocity() -> Vector2:
	var kb_Velocity: = Vector2.ZERO
	return Vector2((global_position.x - get_parent().get_node("Player").global_position.x) * kb_force, 
	(global_position.y - get_parent().get_node("Player").global_position.y) * kb_force)

func move_along_path(distance: float) -> void:
	var start_point: = position
	for i in range(path.size()):
		var distance_to_next: = start_point.distance_to(path[0])
		if distance <= distance_to_next and distance >= 0.0:
			position = start_point.linear_interpolate(path[0], distance / distance_to_next)
			break
		elif distance < 0.0:
			position = path[0]
			set_process(false)
			break
		distance -= distance_to_next
		start_point = path[0]
		path.remove(0)

func set_path(value : PoolVector2Array) -> void:
	path = value
	if value.size() == 0:
		return
	set_process(true)

func check_death() -> void:
	if health <= 0.0:
		queue_free()
