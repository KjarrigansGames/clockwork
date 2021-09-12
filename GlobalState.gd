extends Node

signal pause
signal play
signal finished

enum STATE { PLAY, PAUSE }
var current_state = STATE.PLAY

func _ready():
    connect("finished", self, "finished_level")
    connect("pause", self, "pause_game")
    connect("play", self, "play_game")
    
func pause_game():
    print("Game Paused")
    current_state = STATE.PAUSE
    
func play_game():
    print("Game Playing")
    current_state = STATE.PLAY

func finished_level():
    print("Level finished")
    current_state = STATE.PAUSE

func is_paused():
    return current_state == STATE.PAUSE
    
