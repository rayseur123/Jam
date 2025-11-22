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
	$s_key.frame = 0
	
func get_money():
	$s_key.visible = 0
	$s_coin.visible = 1

func lose_heart():
	get_node("heart" + str(Global.heart)).modulate = Color(0.065, 0.065, 0.065, 1.0)
	if (Global.heart > 0):
		Global.heart -= 1

func update_heart():
	if (Global.heart == 2):
		get_node("heart3").modulate = Color(0.065, 0.065, 0.065, 1.0)
	if (Global.heart == 1):
		get_node("heart3").modulate = Color(0.065, 0.065, 0.065, 1.0)
		get_node("heart2").modulate = Color(0.065, 0.065, 0.065, 1.0)
	if (Global.heart == 0):
		get_tree().change_scene_to_file("res://menu/over/game_over.tscn")
		

func all_heart():
	$heart1.modulate = Color(1.0, 1.0, 1.0, 1.0)
	$heart2.modulate = Color(1.0, 1.0, 1.0, 1.0)
	$heart3.modulate = Color(1.0, 1.0, 1.0, 1.0)
