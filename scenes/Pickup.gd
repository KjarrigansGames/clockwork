extends StaticBody2D
class_name Pickup

func interact(player : Player):
    if player.picked_up_object != null:
        # TODO, handle if the player already has something picked up
        # at the moment do nothing but maybe we want to swap items
        return
    
    # Disable all the Stuff so it won't collide (pun intended) with anything
    $InteractionArea.hide()
    $CollisionShape2D.hide()
    $LightOccluder2D.hide()
    player.pick_up(self)
