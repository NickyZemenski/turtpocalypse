extends CharacterBody2D


@onready var hero =$"../Player"

var speed :float = 150
var isMoving = true
var moveDelay = 0.0

#add knockback variables
var knockbackDir = Vector2.ZERO
var knockbackTime = 0.0
var knockbackSpeed = 400.0


var launchSpeed :float = 415
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("enemies")
	pass

func _physics_process(delta):
	if knockbackTime > 0:
		global_position += knockbackDir * knockbackSpeed * delta
		knockbackTime -= delta
		
		if knockbackTime <= 0:
			moveDelay = 0.2
			
		return
	if moveDelay > 0:
		moveDelay -= delta
		if moveDelay <= 0:
			isMoving = true
		return
		
	if isMoving:
		var direction = global_position.direction_to(hero.global_position)
		global_position += direction * speed * delta

func applyKnockback(from_position: Vector2):
	knockbackDir = (global_position - from_position).normalized()
	knockbackTime = 0.25    
	isMoving = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#if isMoving:
		#_MoveTowards(hero, delta)

#func _MoveTowards(target,delta)->void:
	#if (position != target.position):
		#var direction: Vector2 = global_position.direction_to(target.global_position)
		#global_position += direction * speed * delta
#func _MoveTowardsTwo(target,delta)->void:
	#if (position != target.position):
		#position = position.lerp(target.position, speed* delta)
		
#func _MoveTowardsThree(target,delta)->void:
	#if (position != target.position):
	#pass
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	get_tree().call_group("enemies", "applyKnockback", hero.global_position)
	
	hero.hp -= 1
	print(hero.hp)
	
	
	if hero.hp <= 0:
		print("You died!")
