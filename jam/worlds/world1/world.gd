extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$chest.connect("use_key", $HUD.no_key)
	$key.connect("key_collected", $HUD.have_key)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
