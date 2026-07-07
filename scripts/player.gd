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
