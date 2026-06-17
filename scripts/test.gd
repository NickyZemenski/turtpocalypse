extends Node2D

@onready var character = $Player
@onready var timer = $Timer
@onready var timer_label = $HUD/VBoxContainer/TimerLabel

var time_left := 5.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Update timer label
	var time_left = timer.time_left

	var total_seconds = int(time_left)
	var minutes = total_seconds / 60
	var seconds = total_seconds % 60

	timer_label.text = "%02d:%02d" % [minutes, seconds]


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scene/GameOver.tscn")
