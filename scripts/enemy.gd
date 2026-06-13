extends Node2D

@onready var hero =$"../Character"

var speed :float = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_MoveTowards(hero, delta)


func _MoveTowards(target,delta)->void:
	if (self.position != target.position):
		self.position = self.position.lerp(target.position, speed* delta)
	
