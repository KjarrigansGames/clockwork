extends Line2D

var target

export(NodePath) var targetPath

# Called when the node enters the scene tree for the first time.
func _ready():
    target = get_node(targetPath)
    pass # Replace with function body.

func paint_point():
    global_position = Vector2(0,0)
    global_rotation = 0
    
    add_point(target.global_position)
    pass
