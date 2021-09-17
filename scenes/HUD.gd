extends CanvasLayer

var remaining_time = 999

func _ready():
    $PauseMenu.hide()
    $Tint.hide()

func _process(delta):   
    if GlobalState.is_paused():
        return
    
    if Input.is_action_just_pressed("ui_cancel"):
        pause()
            
    remaining_time -= delta
    if remaining_time <= 0:
        game_over()
        
    $PanelContainer/HBoxContainer/TimeLeft.text = "Time Left: %d" % remaining_time

func game_won():
    pause()
    $PauseMenu/VBoxContainer/Title.text = "Congratulations"
    $PauseMenu/VBoxContainer/Subtitle.show()
    $PauseMenu/VBoxContainer/Subtitle.text = "Remaining Time: %.2f" % remaining_time
    
    $PauseMenu/VBoxContainer/Continue.hide()

func game_over():
    pause()    
    $PauseMenu/VBoxContainer/Title.text = "Game Over"
    $PauseMenu/VBoxContainer/Continue.hide()
    
func pause():
    GlobalState.emit_signal("pause")  
    
    $PauseMenu/VBoxContainer/Title.text = "Game Paused"
    $PauseMenu/VBoxContainer/Continue.show()
    $Tint.show()
    $PauseMenu.show()    

func _on_Continue_pressed():
    $Tint.hide()
    $PauseMenu.hide()
    GlobalState.emit_signal("play")

func _on_Menu_pressed():
    get_tree().change_scene("res://scenes/Menu.tscn")
