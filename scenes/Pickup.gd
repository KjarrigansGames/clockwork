extends StaticBody2D
class_name Pickup

export var item_texture : Texture
export var item_type : String

func _ready():
    $Sprite.texture = item_texture

func interact(player):
    if player.pickup_object:
        # TODO, handle if the player already has something picked up
        # at the moment do nothing but maybe we want to swap items
        return
    
    # Disable all the Stuff so it won't collide (pun intended) with anything
    player.pick_up(self)
    get_parent().remove_child(self)

func _physics_process(delta):
    rotation += delta
