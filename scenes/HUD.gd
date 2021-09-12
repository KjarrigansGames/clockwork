extends CanvasLayer

var remaining_time = 999

func _process(delta):
    if GlobalState.is_paused():
        return
    
    remaining_time -= delta
    if remaining_time <= 0:
        $Notice/Message.show()
        GlobalState.emit_signal("pause")
        
    $PanelContainer/HBoxContainer/TimeLeft.text = "Time Left: %d" % remaining_time
