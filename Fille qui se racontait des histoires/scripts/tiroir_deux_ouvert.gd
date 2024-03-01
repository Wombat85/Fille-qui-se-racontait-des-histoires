extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var oeil = load("res://art/symbole-de-l-oeil-noir.png")
	Input.set_custom_mouse_cursor(oeil, Input.CURSOR_CAN_DROP)
	Indices.liste.append("manuscrit")

# Called every frame. 'delta' is the elapsed time since the previous frame.

	
func _on_tiroirmanus_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		OS.shell_open("https://drive.google.com/file/d/14_qGM6ecnd0lEULNN9mO7L8Tv5deHpuj/view?usp=sharing")

func _on_tiroirmanus_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_CAN_DROP)


func _on_tiroirmanus_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)


