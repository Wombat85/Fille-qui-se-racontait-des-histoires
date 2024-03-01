extends Node2D


# Called when the node enters the scene tree for the first time.
@onready var oeil = load("res://art/symbole-de-l-oeil-noir.png")
@onready var dialogue = load("res://dialogues/remarques.dialogue")
# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.show_dialogue_balloon_scene("res://addons/dialogue_manager/example_balloon/example_balloon.tscn", dialogue, "startphotos")
	Input.set_custom_mouse_cursor(oeil, Input.CURSOR_CAN_DROP)


func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed (MOUSE_BUTTON_LEFT):
			get_tree().change_scene_to_file("res://scenes/video_anniv.tscn")


func _on_area_2d_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_CAN_DROP)


func _on_area_2d_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
