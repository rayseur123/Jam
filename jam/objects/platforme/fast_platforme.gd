extends Area2D

const TIME_TO_DESTROY = 0.5

var is_here = 0
var time_player_enter = 0.0

@onready var sprite = $Sprite2D
@onready var collision = $CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if is_here:
		if  (((Time.get_ticks_msec() / 1000.0) - time_player_enter) >= TIME_TO_DESTROY):
			start_disappear()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		is_here = 1
		time_player_enter = Time.get_ticks_msec() / 1000.0


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		start_disappear()

func start_disappear():
	if collision.disabled:
		return
	var tween = create_tween()
	tween.tween_property(sprite, "modulate:a", 0.0, 0.5)
	tween.finished.connect(queue_free)
