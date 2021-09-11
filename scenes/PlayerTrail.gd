extends Line2D

var target

export(NodePath) var targetPath

# Called when the node enters the scene tree for the first time.
func _ready():
	target = get_node(targetPath)
	# For sanity
	clear_points()
	pass # Replace with function body.

func paint_point():
	global_position = Vector2(0,0)
	global_rotation = 0

	var last = get_last()
	var distance = last.distance_to(target.global_position)

	if last == null || distance > 3:
		add_point(target.global_position)
		print(get_point_count())
	pass

func pop_last():
	global_position = Vector2(0,0)
	global_rotation = 0

	var last = get_last()
	remove_point(get_point_count() -1)

	return last

func get_last():
	return get_point_position(get_point_count() -1)
