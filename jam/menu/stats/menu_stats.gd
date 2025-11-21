extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Control/gain_val.text = str(Global.gain)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
