extends Node2D

@onready var timer = %Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_interaction_area_input_event(_viewport, _event, _shape_idx):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		timer.start()
		

func _on_timer_timeout():
		get_tree().change_scene_to_file("res://scenes/edition_deux.tscn")
