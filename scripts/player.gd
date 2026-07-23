extends RigidBody2D

var force = 100
var swipe_impulse := 25

var touch_start := Vector2.ZERO
var swipe_threshold := 50


func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("move_right"):
		apply_force(Vector2.RIGHT * force)
	if Input.is_action_pressed("move_left"):
		apply_force(Vector2.LEFT * force)
	if Input.is_action_pressed("move_up"):
		apply_force(Vector2.UP * force)
	if Input.is_action_pressed("move_down"):
		apply_force(Vector2.DOWN * force)

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			touch_start = event.position
		else:
			var delta: Vector2 = event.position - touch_start
			if delta.length() < swipe_threshold:
				return
			if abs(delta.x) > abs(delta.y):
				if delta.x > 0:
					apply_impulse(Vector2.RIGHT * swipe_impulse)
				else:
					apply_impulse(Vector2.LEFT * swipe_impulse)
			else:
				if delta.y > 0:
					apply_impulse(Vector2.DOWN * swipe_impulse)
				else:
					apply_impulse(Vector2.UP * swipe_impulse)

func stop_moviment() -> void:
	# Desativa os métodos de input e física do player
	set_physics_process(false)
	set_process_input(false)
	
	linear_damp = 5.0
	await get_tree().create_timer(1.0).timeout
	
	# Zera a velocidade e congela o RigidBody
	linear_velocity = Vector2.ZERO
	angular_velocity = 0
	freeze = true
