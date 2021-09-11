extends Line2D

var target

export(NodePath) var targetPath

var segments = []

# Called when the node enters the scene tree for the first time.
func _ready():
	target = get_node(targetPath)
	# For sanity
	clear_points()
	add_point(target.global_position)

	pass # Replace with function body.

func paint_point():
	global_position = Vector2(0,0)
	global_rotation = 0

	var last = get_from_back(0)

	var distance = last.distance_to(target.global_position)

	if distance > 30:
		if get_point_count() > 1:
			add_collision(last, get_from_back(1) )

		add_point(target.global_position)
	pass

func add_collision(a, b):
	var node = CollisionShape2D.new()
	var segment = SegmentShape2D.new()

	segment.a = a
	segment.b = b

	node.shape = segment

	$CollissionOwner.add_child(node)
	segments.push_front(node)

func pop_last():
	if get_point_count() == 1:
		return target.global_position

	global_position = Vector2(0,0)
	global_rotation = 0

	var last: Vector2 = get_from_back(0)
	remove_point(get_point_count() -1)

	for seg in segments:
		if last.distance_to(seg.shape.a) == 0:
			seg.queue_free()
			segments.erase(seg)
			return last

	return last

func get_from_back(index):
	if get_point_count() > 0:
		return get_point_position(get_point_count() -1 - index)
	return null
