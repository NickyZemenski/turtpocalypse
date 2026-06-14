extends Node2D

@onready var hero =$"../Player"

var heroPosition = 0

var speed :float = 180

var launchSpeed :float = 80
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	heroPosition = hero.position
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#_MoveTowards(hero, delta)
	pass
	
func _MoveTowards(target,delta)->void:
	if (position != target.position):
		var direction: Vector2 = global_position.direction_to(target.global_position)
		global_position += direction * speed * delta
		
		
		
		
func _MoveTowardsTwo(target,delta)->void:
	if (position != target.position):
		position = position.lerp(target.position, speed* delta)
		
func _MoveTowardsThree(target)->void:
	if (position != target):
		var direction: Vector2 = global_position.direction_to(target)
		global_position += direction * launchSpeed


	


func _on_jump_timer_timeout() -> void:
	_MoveTowardsThree(heroPosition)
	heroPosition = hero.position
