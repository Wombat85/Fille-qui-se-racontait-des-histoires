extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var oeil = load("res://art/symbole-de-l-oeil-noir.png")
	Input.set_custom_mouse_cursor(oeil, Input.CURSOR_CAN_DROP)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_CAN_DROP)


func _on_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)

func _on_input_event(_viewport, _event, _shape_idx):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var mp = get_global_mouse_position()
		if (mp.x >=570 && mp.x <=680) && (mp.y >=40 && mp.y <=135):
			get_tree().change_scene_to_file("res://scenes/photosanniv.tscn")
		elif (mp.x >=500 && mp.x<=660) && (mp.y >=180 && mp.y <=270):
			get_tree().change_scene_to_file("res://scenes/grandordi.tscn")
		elif (mp.x >320 && mp.x<=435) && (mp.y >=240 && mp.y <=300):
			get_tree().change_scene_to_file("res://scenes/petitordi.tscn")
		elif (mp.x >=710 && mp.x<=790) && (mp.y >=100 && mp.y <=135):
			get_tree().change_scene_to_file("res://scenes/lecture.tscn")
		elif (mp.x >=730 && mp.x<=820) && (mp.y >=270 && mp.y <=300):
			get_tree().change_scene_to_file("res://scenes/livres.tscn")
		elif (mp.x >=870 && mp.x<=930) && (mp.y >=10 && mp.y <=130):
			get_tree().change_scene_to_file("res://scenes/theatre.tscn")
		elif (mp.x >=200 && mp.x<=280) && (mp.y >=0 && mp.y <=120):
			get_tree().change_scene_to_file("res://scenes/tableau.tscn")
		elif (mp.x >=480 && mp.x<=570) && (mp.y >=440 && mp.y <=550):
			get_tree().change_scene_to_file("res://scenes/poubelle.tscn")

