extends StaticBody2D
class_name Stopper

export var needs_item_type : String

func interact(player):
    if (player.pickup_object && 
        player.pickup_object.item_type == needs_item_type):
        player.drop()
        queue_free()
        return
    
    print("You need a " + needs_item_type + " to remove that block.")
