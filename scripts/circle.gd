extends KinematicBody2D

var speed = 100
var velocity = Vector2()
var target = Vector2()

export(NodePath) var path
var path_points
var path_point_index = 0


func _ready():
	if path:
		path_points = get_node(path).curve.get_baked_points()

func _physics_process(delta):
	if !path:
		return
	var target = path_points[path_point_index]
	if position.distance_to(target) < 1:
		path_point_index = wrapi(path_point_index+1, 0, path_points.size())
		target = path_points[path_point_index]
	
	velocity = (target-position).normalized() * speed
	var collision = move_and_collide(velocity*delta)
	
	if collision :
		collision.collider.move_and_collide(velocity*delta)
	
	
