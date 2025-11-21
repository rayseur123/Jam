extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func have_key():
	$s_key.frame = 1

func no_key():
	$s_key.visible = 0
	$s_coin.visible = 1
