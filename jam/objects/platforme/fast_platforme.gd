extends Area2D

const TIME_TO_DESTROY = 1.0

var is_here = 0
var time_player_enter = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_here:
		if  (((Time.get_ticks_msec() / 1000) - time_player_enter) >= TIME_TO_DESTROY):
			queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		is_here = 1
		time_player_enter = Time.get_ticks_msec() / 1000


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		queue_free()
