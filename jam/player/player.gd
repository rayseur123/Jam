extends CharacterBody2D

const tile_size = 32

var is_moving: bool = false

func _physics_process(delta: float) -> void:
	_move()
	move_and_slide()

func _move() -> void:
	var direction = Vector2.ZERO

	if Input.is_action_just_pressed("up"):
		direction.y -= 1
	elif Input.is_action_just_pressed("down"):
		direction.y += 1
	elif Input.is_action_just_pressed("right"):
		direction.x += 1
	elif Input.is_action_just_pressed("left"):
		direction.x -= 1
	global_position += direction.normalized() * tile_size


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("door") && Global.gain > 0:
		queue_free()
		get_tree().change_scene_to_file("res://menu/stats/menu_stats.tscn")
		Global.new_world()
