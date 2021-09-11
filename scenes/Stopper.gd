extends StaticBody2D
class_name Stopper

func interact(player):
    if player.pickup_object && player.pickup_object.name == "Pickup":
        player.drop()
        queue_free()
        return
    
    print("You need a Gear to remove that block.")
