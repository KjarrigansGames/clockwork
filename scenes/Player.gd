extends KinematicBody2D
class_name Player

const SPEED = 300
const ROTATION_SPEED = 10;

var velocity = Vector2.ZERO
var rotation_direction = 0
var interactable_object
var picked_up_object

func _input(event):
    if event.is_action_released("ui_interact") && interactable_object != null:
        interactable_object.interact(self)

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
    $PlayerTrail.paint_point()

func _on_InteractionArea_area_entered(area):
    print("Interactable Object available!")
    interactable_object = area.get_parent()

func _on_InteractionArea_area_exited(area):
    print("Interactable Object gone!")
    interactable_object = null

func pick_up(object):
    pass
