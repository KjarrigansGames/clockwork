extends Node2D

export var time_to_finish = 100

func _ready():
    $Player/Camera2D/HUD.remaining_time = time_to_finish
    GlobalState.connect("finished", self, "next_level")
    
func next_level():
    # TODO, actual next level
    get_tree().change_scene("res://scenes/Menu.tscn")
