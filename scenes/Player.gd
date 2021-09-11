extends KinematicBody2D

const SPEED = 300
const ROTATION_SPEED = 10;

var velocity = Vector2.ZERO
var rotation_direction = 0

func handle_input():
	rotation_direction = 0
	velocity = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		rotation_direction += 1
	if Input.is_action_pressed("ui_left"):
		rotation_direction -= 1
	if Input.is_action_pressed("ui_down"):
		velocity -= transform.x * SPEED
	if Input.is_action_pressed("ui_up"):
		velocity += transform.x * SPEED

func _physics_process(delta):
	handle_input()
	rotation += rotation_direction * ROTATION_SPEED * delta

	velocity = move_and_slide(velocity)
	get_node("PlayerTrail").paint_point()
