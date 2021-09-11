extends Node

signal pause
signal play

enum STATE { PLAY, PAUSE }
var current_state = STATE.PAUSE

func _ready():
    connect("pause", self, "pause_game")
    connect("play", self, "play_game")
    
func pause_game():
    print("Game Paused")
    current_state = STATE.PAUSE
    
func play_game():
    print("Game Playing")
    current_state = STATE.PLAY

func is_paused():
    return current_state == STATE.PAUSE
