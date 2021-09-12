extends AnimatedSprite

const item_type = 'Level-End'

func interact(_player):
    playing = true
    GlobalState.emit_signal("pause")
    yield(get_tree().create_timer(2.5), "timeout")
    GlobalState.emit_signal("finished")
