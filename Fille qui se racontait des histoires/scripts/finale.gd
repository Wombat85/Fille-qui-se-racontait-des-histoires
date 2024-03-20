extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var main = load("res://art/icone-de-la-main-rouge.png")

	Input.set_custom_mouse_cursor(main, Input.CURSOR_POINTING_HAND)#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


func _on_area_2d_input_event(_viewport, _event, shape_idx):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_area_2d_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)


func _on_area_2d_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
