extends AnimatedSprite

const item_type = 'Level-End'
const item_sound = preload("res://sounds/Level-End.wav")

func interact(_player):
    playing = true
    $Sound.play()
    GlobalState.emit_signal("pause")
    yield(get_tree().create_timer(2.5), "timeout")
    GlobalState.emit_signal("finished")
