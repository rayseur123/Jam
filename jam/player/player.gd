extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta: float) -> void:
	_gestion_deplacement()
	move_and_slide()

func _gestion_deplacement() -> void:
	var direction = Vector2.ZERO

	if Input.is_action_pressed("up"):
		direction.y -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1

	velocity = direction.normalized() * SPEED


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("door") && Global.money == 1:
		queue_free()
