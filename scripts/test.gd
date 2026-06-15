extends Node2D

@onready var player = $Player
@onready var timer = $Timer
@onready var timer_label = $HUD/VBoxContainer/TimerLabel

var time_left := 5.0

var heart_full = preload("res://assets/hud/health_full.png")
var heart_empty = preload("res://assets/hud/health_empty.png")

@onready var hearts = [
	$HUD/VBoxContainer/HBoxContainer/HeartRect1,
	$HUD/VBoxContainer/HBoxContainer/HeartRect2,
	$HUD/VBoxContainer/HBoxContainer/HeartRect3
]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.died.connect(_on_player_died)
	player.health_changed.connect(update_hearts)
	update_hearts(player.hp)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Move player to mouse on click
	if Input.is_action_just_pressed("leftClick"):
		player.position = get_viewport().get_mouse_position()
	# Update timer label
	var time_left = timer.time_left

	var total_seconds = int(time_left)
	var minutes = total_seconds / 60
	var seconds = total_seconds % 60

	timer_label.text = "%02d:%02d" % [minutes, seconds]


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scene/GameOver.tscn")

func _on_player_died() -> void:
	get_tree().change_scene_to_file("res://scene/GameOver.tscn")

func update_hearts(current_hp):
	for i in range(hearts.size()):
		if i < current_hp:
			hearts[i].texture = heart_full
		else:
			hearts[i].texture = heart_empty
