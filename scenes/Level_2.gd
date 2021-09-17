extends Node2D

export var time_to_finish : int
export var standalone : bool = false
var finished = false

func _ready():
    if standalone:
        $Player/Camera2D/HUD.remaining_time = time_to_finish
        GlobalState.connect("finished", self, "next_level")
        
        $PlayerTrail.add_point($Starter/TrailAnchor.global_position)
        $PlayerTrail.connect_to($Player)
                
        GlobalState.emit_signal("play")
    else:
        remove_child($Player)
        remove_child($Starter)     
        remove_child($CanvasModulate)  
        remove_child($PlayerTrail)

func _process(_delta):
    if not finished:
        return
        
    $Player.move_back()
    if not $PlayerTrail.has_pullback_points():
        get_tree().change_scene("res://scenes/Level_3.tscn")
        GlobalState.emit_signal("play")
    
func next_level():
    finished = true
