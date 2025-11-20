extends StaticBody2D


func _on_detection_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if Global.key == 1:
			$Sprite2D.frame = 1
			print("MONNEY MONNNEYYYYY")
			Global.money = 1
			Global.key = 0
		elif Global.money == 0:
			print("Need key")
		else:
			print("Chest already opened")
	pass # Replace with function body.
