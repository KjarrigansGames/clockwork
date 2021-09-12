extends StaticBody2D
class_name Powerup

export var item_texture : Texture
export var speed_bonus : int
const item_type = 'Powerup'
const item_sound = preload("res://sounds/Powerup.wav")

func _ready():
    $Sprite.texture = item_texture

func interact(player):
    if player.pickup_object:
        player.drop() 
    
    # Disable all the Stuff so it won't collide (pun intended) with anything
    player.pick_up(self)
    get_parent().remove_child(self)
