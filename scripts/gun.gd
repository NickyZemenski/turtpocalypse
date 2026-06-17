extends Node2D

@export var bullet_scene: PackedScene
@onready var muzzle = $Muzzle
@onready var gun: AnimatedSprite2D = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mousePos = get_global_mouse_position()
	
	gun.flip_v = mousePos.x < get_parent().global_position.x
	
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	var bullet = bullet_scene.instantiate()
	bullet.global_position = muzzle.global_position
	bullet.direction = (
		get_global_mouse_position() - muzzle.global_position
	).normalized()
	
	get_tree().current_scene.add_child(bullet)
