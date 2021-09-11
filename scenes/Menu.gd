extends Control

func _on_New_Game_pressed():
    get_tree().change_scene("res://scenes/Level.tscn")

func _on_Exit_pressed():
    get_tree().quit()
