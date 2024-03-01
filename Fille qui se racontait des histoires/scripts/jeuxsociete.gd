extends Node2D

@onready var oeil = load("res://art/symbole-de-l-oeil-noir.png")
@onready var timer = %Timer
@onready var time = true
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_custom_mouse_cursor(oeil, Input.CURSOR_CAN_DROP)
	Indices.liste.append("jeux")
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_atelierjeux_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_CAN_DROP)


func _on_atelierjeux_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)


func _on_atelierjeux_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if time == false:
			get_tree().change_scene_to_file("res://scenes/nabuccho.tscn")


func _on_timer_timeout():
	time = false
