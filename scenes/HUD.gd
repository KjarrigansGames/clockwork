extends CanvasLayer

var remaining_time = 999

func _ready():
    $PauseMenu.hide()
    $Tint.hide()

func _process(delta):   
    if GlobalState.is_paused():
        return
    
    if Input.is_action_just_pressed("ui_cancel"):
            GlobalState.emit_signal("pause")  
            $Tint.show()
            $PauseMenu.show()
            
    remaining_time -= delta
    if remaining_time <= 0:
        $Notice/Message.show()
        GlobalState.emit_signal("pause")
        
    $PanelContainer/HBoxContainer/TimeLeft.text = "Time Left: %d" % remaining_time

func _on_Continue_pressed():
    $Tint.hide()
    $PauseMenu.hide()
    GlobalState.emit_signal("play")

func _on_Menu_pressed():
    get_tree().change_scene("res://scenes/Menu.tscn")
