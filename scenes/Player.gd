extends KinematicBody2D
class_name Player

export var base_speed = 300
const ROTATION_SPEED = 5;
var speed

var velocity = Vector2.ZERO
var rotation_direction = 0

var interactable_object
var pickup_rotation = 0
var pickup_object

var trail : PlayerTrail

func _ready():
    $PickupSprite.hide()
    speed = base_speed

func _input(event):
    if GlobalState.is_paused():
        return 
    
    if event.is_action_released("ui_interact") && interactable_object != null:
        interactable_object.interact(self)
        
func handle_input(delta: float):
    rotation_direction = 0
    velocity = Vector2.ZERO

    if Input.is_action_pressed("ui_right"):
        if not $UpRay.is_colliding():
            rotation_direction += 1
    if Input.is_action_pressed("ui_left"):
        if not $BottomRay.is_colliding():
            rotation_direction -= 1
    if Input.is_action_pressed("ui_down"):
        move_back()
        return
    if Input.is_action_pressed("ui_up"):
        velocity += transform.x * speed    
    
    rotation += rotation_direction * ROTATION_SPEED * delta
        
    # For DEBUG
    $Camera2D/HUD/PanelContainer/HBoxContainer/TrailPoints.text = "Trail Points: %d" % trail.get_point_count()
    
    velocity = move_and_slide(velocity)
    
    trail.record_position()

    # "Animate" the picked up object by slightly rotating it every tick
    if pickup_object:
        $PickupSprite.rotation += (2 * delta)

func move_back():
    if not trail.has_pullback_points():
        return
        
    var last = trail.last_record()
    var second_last = trail.try_second_last_record()

    if second_last != null:
        rotation = last.angle_to_point(second_last)

    velocity -= transform.x * (speed + 200) 
    velocity = move_and_slide(velocity)

    var distance_to_last = trail.distance_to_last(global_position)

    if distance_to_last < 5 || distance_to_last > 10:
        trail.remove_last_record()

    while (trail.distance_to_second_last(global_position) != null &&
           trail.distance_to_second_last(global_position) < trail.distance_to_last(global_position)):
        trail.remove_last_record()


func _physics_process(delta):
    if GlobalState.is_paused():
        return
    
    handle_input(delta)

func _on_InteractionArea_area_entered(area):
    interactable_object = area.get_parent()

func _on_InteractionArea_area_exited(_area):
    interactable_object = null

func pick_up(object):
    pickup_object = object
    
    # Add sprite of the object to the pickup slot as visual indicator
    $PickupSprite.texture = object.get_node("Sprite").texture
    $PickupSprite.show()
    
    $PickupSound.stream = object.item_sound
    $PickupSound.play()
    
    if pickup_object.name == 'Powerup':
        speed += pickup_object.speed_bonus
    
func drop(drop_sound=null):
    if drop_sound:
        $PickupSound.stream = drop_sound
        $PickupSound.play()
    
    if pickup_object.name == 'Powerup':
        speed = base_speed
    
    pickup_object.queue_free()
    pickup_object = null
    
    $PickupSprite.texture = null
    $PickupSprite.hide()
