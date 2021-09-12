extends Node2D

export var time_to_finish : int
export var standalone : bool = false

func _ready():
    if standalone:
        $Player/Camera2D/HUD.remaining_time = time_to_finish
        GlobalState.connect("finished", self, "next_level")
    else:
        remove_child($Player)
        remove_child($Starter)     
        remove_child($CanvasModulate)  
        remove_child($PlayerTrail)
    
func next_level():
    # TODO, actual next level
    get_tree().change_scene("res://scenes/Menu.tscn")
