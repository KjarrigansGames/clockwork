extends Line2D
class_name PlayerTrail

var player

func connect_to(player):
    print("Attached!")
    player.trail = self
    self.player = player
    add_point(player.global_position)

func _physics_process(_delta):
    update_to_player_pos()

func update_to_player_pos():
    var last_point = get_point_count() - 1
    set_point_position(last_point, player.global_position)

func record_position():
    var player_pos: Vector2 = player.global_position
    var last: Vector2 = last_record()

    var distance = last.distance_to(player_pos)
    # Force some distance between points
    if distance < 12:
        return

    add_point(player_pos)

func remove_last_record():
    var count = get_point_count()
    if count > 2:
        remove_point(get_point_count() -2)

# Returns the last point that is not the player position
func last_record() -> Vector2: 
    return get_point_position(get_point_count() - 2)

func try_second_last_record():
    var count = get_point_count()

    if count > 2:
        return get_point_position(count - 3)
    return null

func has_pullback_points() -> bool:
    return get_point_count() > 3
    
func distance_to_last(point: Vector2) -> float:
    return point.distance_to(last_record())

func distance_to_second_last(point: Vector2):
    var second_last = try_second_last_record()
    if second_last != null:
        return point.distance_to(second_last)
    return null

