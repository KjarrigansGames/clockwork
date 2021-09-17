extends Control

var time = 0

func _on_New_Game_pressed():
    get_tree().change_scene("res://scenes/Level_1.tscn")

func _on_Exit_pressed():
    get_tree().quit()

func _process(delta):
    $Title/Gear.rotation += delta
