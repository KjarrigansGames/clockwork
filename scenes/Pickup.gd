extends StaticBody2D
class_name Pickup

export var item_texture : Texture
export var item_type : String
const item_sound = preload("res://sounds/Pickup.wav")

func _ready():
    $Sprite.texture = item_texture

func interact(player):
    if player.pickup_object:
        if player.pickup_object.item_type == 'Powerup':
            player.drop()
        else:
            return
        
    player.pick_up(self)
    get_parent().remove_child(self)    

func _physics_process(delta):
    if GlobalState.is_paused():
        return 
        
    rotation += delta
