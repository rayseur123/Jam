extends CharacterBody2D

const tile_size = 32

var is_moving = false
var sprite_node: Tween
var on_platforme = 1
signal lose_heart

func _physics_process(_delta: float) -> void:
	_move()

func _move() -> void:
	if is_moving:
		return
	if !on_platforme:
		emit_signal("lose_heart")
		if (Global.heart == 0):
			get_tree().change_scene_to_file("res://menu/over/game_over.tscn")
	var direction = Vector2.ZERO
	if Input.is_action_just_pressed("up"):
		direction.y -= 1
	elif Input.is_action_just_pressed("down"):
		direction.y += 1
	elif Input.is_action_just_pressed("right"):
		direction.x += 1
	elif Input.is_action_just_pressed("left"):
		direction.x -= 1
	elif Input.is_action_just_pressed("kill"):
		emit_signal("lose_heart")
		get_tree().change_scene_to_file("res://worlds/world" + str(Global.world) + "/world.tscn")
	move_and_slide()
	if direction == Vector2.ZERO:
		return
	is_moving = true
	global_position += direction * tile_size
	$Sprite2D.global_position -= direction * tile_size
	if sprite_node:
		sprite_node.kill()
	sprite_node = create_tween()
	sprite_node.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	sprite_node.tween_property($Sprite2D, "global_position", global_position, 0.185).set_trans(Tween.TRANS_SINE)
	sprite_node.finished.connect(_on_move_finished)

func _on_move_finished():
	is_moving = false

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("door") && Global.gain > 0:
		get_tree().change_scene_to_file("res://menu/stats/menu_stats.tscn")
		Global.world += 1
		Global.new_world()
	if area.is_in_group("platforme"):
		on_platforme = 1
