extends Node2D

@export var enemyScene: PackedScene

@export var radius :float = 200.0 

var colors = [Color(1.0, 0.0, 0.0, 1.0),
		  Color(0.0, 1.0, 0.0, 1.0),
		  Color(0.0, 0.0, 1.0, 0.0)]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _spawnEnemy() -> void:
	var random_angle =  randf_range(0.0, TAU)
	
	var spawn_direction = Vector2.from_angle(random_angle)
	
	var spawn_pos = global_position + (spawn_direction * radius)
	
	var enemy = enemyScene.instantiate()
	
	

	enemy.global_position = spawn_pos
	

	add_child(enemy)
	enemy.add_to_group("enemies")
	randomize()
	enemy.self_modulate = colors[randi() % colors.size()]


func _on_enemy_spawner_timeout() -> void:
	_spawnEnemy()
