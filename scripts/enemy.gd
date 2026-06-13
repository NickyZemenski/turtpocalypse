extends CharacterBody2D

@onready var hero =$"../Player"

var speed :float = 150

var launchSpeed :float = 415
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_MoveTowards(hero, delta)

func _MoveTowards(target,delta)->void:
	if (position != target.position):
		var direction: Vector2 = global_position.direction_to(target.global_position)
		global_position += direction * speed * delta
		
		
		
		
func _MoveTowardsTwo(target,delta)->void:
	if (position != target.position):
		position = position.lerp(target.position, speed* delta)
		
func _MoveTowardsThree(target,delta)->void:
	#if (position != target.position):
	pass
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	hero.HP -= 1
	print(hero.HP)
	if hero.HP <= 0:
		print("You died!")
