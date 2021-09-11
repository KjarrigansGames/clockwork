extends Node2D

export var time_to_finish = 100

func _ready():
    $Player/Camera2D/HUD.remaining_time = time_to_finish
