extends Node2D

@onready var fleche = load("res://art/fleche.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_custom_mouse_cursor(fleche, Input.CURSOR_CAN_DROP)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		get_tree().change_scene_to_file("res://scenes/jeuxvideos.tscn")
		


func _on_area_2d_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_CAN_DROP)


func _on_area_2d_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
