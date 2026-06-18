extends CharacterBody2D

signal health_changed(current_hp)
signal died

@onready var player = $mainCharacter

const SPEED = 300.0
var hp = 3

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionX := Input.get_axis("moveLeft", "moveRight")
	var directionY := Input.get_axis("moveUp","moveDown")
	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if directionY:
		velocity.y = directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()


	#player sprite turning
	var mousePos = get_global_mouse_position()

	player.flip_h = mousePos.x < global_position.x



func take_dmg(amount: int) -> void:
	hp -= amount
	print("Dmg taken")
	
	health_changed.emit(hp)
	
	if hp <= 0:
		died.emit()
