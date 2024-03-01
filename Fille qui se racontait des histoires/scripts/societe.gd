extends Node2D

@onready var dialogue = load("res://dialogues/remarques.dialogue")
# Called when the node enters the scene tree for the first time.
func _ready():
	var main = load("res://art/icone-de-la-main-rouge.png")
	Input.set_custom_mouse_cursor(main, Input.CURSOR_POINTING_HAND)
	Indices.liste.append("societe")
	DialogueManager.show_dialogue_balloon_scene("res://addons/dialogue_manager/example_balloon/example_balloon.tscn", dialogue, "startjeux")
func _on_jeuxsoc_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)


func _on_jeuxsoc_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)


func _on_jeuxsoc_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		get_tree().change_scene_to_file("res://scenes/jeuxsociete.tscn")
