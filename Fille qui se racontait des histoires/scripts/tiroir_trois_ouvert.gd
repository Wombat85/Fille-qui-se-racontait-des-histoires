extends Node2D
@onready var liste = Indices.liste
@onready var main = load("res://art/icone-de-la-main-rouge.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_custom_mouse_cursor(main, Input.CURSOR_CAN_DROP)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_area_2d_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_CAN_DROP)


func _on_area_2d_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)


func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		liste.append("communication")
		OS.shell_open("https://prezi.com/view/6Z2V1KW3uu8o6I2y8jDI/")
