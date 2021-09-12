extends StaticBody2D
class_name Stopper

export var needs_item_type : String
export var needs_item_texture : Texture
const item_sound = preload("res://sounds/Stopper.wav")

func _ready():
    $NeedsItemSprite.texture = needs_item_texture

func interact(player):
    if (player.pickup_object && 
        player.pickup_object.item_type == needs_item_type):
        player.drop(item_sound)
        queue_free()
        return
    
    print("You need a " + needs_item_type + " to remove that block.")
