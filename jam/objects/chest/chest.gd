extends StaticBody2D

signal use_key

func _on_detection_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if Global.key == 1:
			$Sprite2D.frame = 1
			Global.gain += 100
			Global.key = 0
			emit_signal("use_key")
		elif Global.gain == 0:
			print("Need key")
		else:
			print("Chest already opened")
	pass # Replace with function body.
