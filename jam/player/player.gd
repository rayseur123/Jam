extends CharacterBody2D

var key = 0
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
	if area.is_in_group("key"):
		key = 1
		print("I HAVE THE KEY")
	if area.is_in_group("chest"):
		if key == 1:
			print("MONNEY MONNNEYYYYY")
			
			key = 0
		else:
			print("Need key")
	pass # Replace with function body.
