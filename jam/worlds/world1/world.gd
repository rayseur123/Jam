extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HUD.update_heart()
	$chest.connect("use_key", $HUD.get_money)
	$key.connect("key_collected", $HUD.have_key) 
	$player.connect("lose_heart", $HUD.lose_heart)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
