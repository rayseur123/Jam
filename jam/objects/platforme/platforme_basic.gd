extends Area2D


@onready var sprite = $Sprite2D
@onready var collision = $CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		# Physiquement elle ne doit plus être là		
		var tween = create_tween()
		tween.tween_property(sprite, "modulate:a", 0.0, 0.5) # fade en 0.5s
		tween.finished.connect(queue_free)
