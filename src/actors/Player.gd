extends Actor

func _physics_process(_delta):
	if active:
		var direction: = get_direction()
		_velocity = calculate_move_velocity(_velocity, direction, speed)
		_velocity = move_and_slide(_velocity)
	
		movement_animation()
		check_attack()
		check_death()

func get_direction() -> Vector2:
	return Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 
	Input.get_action_strength("move_down") - Input.get_action_strength("move_up"))

func calculate_move_velocity(linear_velocity: Vector2, direction: Vector2, speed: Vector2) -> Vector2:
	var new_velocity = linear_velocity
	new_velocity.x = speed.x * direction.x
	new_velocity.y = speed.y * direction.y
	return new_velocity

func movement_animation() -> void:
	if _velocity.x > 0:
		$AnimatedSprite.play("RunRight")
	elif _velocity.x < 0:
		$AnimatedSprite.play("RunLeft")
	elif _velocity.y > 0 and _velocity.x == 0:
		$AnimatedSprite.play("RunDown")
	elif _velocity.y < 0 and _velocity.x == 0:
		$AnimatedSprite.play("RunUp")	
	else:
		$AnimatedSprite.stop()

func check_attack() -> void:
	if Input.is_action_pressed("left_mouse_click"):
		var mousePosition: = get_local_mouse_position()
		if mousePosition.angle() >= -2.4 and mousePosition.angle() <= -0.9:
			$AttackUp/CollisionShape2D.set_disabled(false)
		elif mousePosition.angle() > -0.9 and mousePosition.angle() < 0.6:
			$AttackRight/CollisionShape2D.set_disabled(false)
		elif mousePosition.angle() >= 0.6 and mousePosition.angle() <= 2.4:
			$AttackDown/CollisionShape2D.set_disabled(false)
		else:
			$AttackLeft/CollisionShape2D.set_disabled(false)
	else:
		$AttackUp/CollisionShape2D.set_disabled(true)
		$AttackRight/CollisionShape2D.set_disabled(true)
		$AttackDown/CollisionShape2D.set_disabled(true)
		$AttackLeft/CollisionShape2D.set_disabled(true)

func _on_EnemyDetector_area_entered(area):
	health -= 10
	print(health)

func check_death() -> void:
	if health <= 0.0:
		hide()
		$CollisionShape2D.set_disabled(true)
		active = false
