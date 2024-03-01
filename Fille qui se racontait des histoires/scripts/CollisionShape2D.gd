extends CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var main = load("res://art/icone-de-la-main-rouge.png")

	Input.set_custom_mouse_cursor(main, Input.CURSOR_POINTING_HAND)#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


func _on_zone_area_entered(area):
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)


func _on_zone_area_exited(area):
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
