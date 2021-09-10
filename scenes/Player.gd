extends KinematicBody2D

const SPEED = 500

func _physics_process(delta):
    var input_x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
    var input_y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
        
    move_and_slide(Vector2(input_x, input_y) * SPEED)
