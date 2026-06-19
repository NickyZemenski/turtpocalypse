extends Area2D

var direction = Vector2.ZERO
var speed = 800.0

func _process(delta):
	global_position += direction * speed * delta

func kill():
	print("should die?")
