extends StaticBody2D
class_name Pickup

func interact(player):
    if player.pickup_object:
        # TODO, handle if the player already has something picked up
        # at the moment do nothing but maybe we want to swap items
        return
    
    # Disable all the Stuff so it won't collide (pun intended) with anything
    player.pick_up(self)
    get_parent().remove_child(self)
