extends Node2D

@onready var fleche = load("res://art/fleche.png")
@onready var dialogue = load("res://dialogues/remarques.dialogue")
@onready var timer = %Timer
@onready var timerdeux = %Timer2
@onready var timertrois = %Timer3
@onready var liste = Indices.liste
@onready var audiostream = %AudioStreamPlayer2D
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_custom_mouse_cursor(fleche, Input.CURSOR_CAN_DROP)
	liste.append("jeuxvideos")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_stjv_area_input_event(_viewport, _event, _shape_idx):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		timerdeux.start()
		


func _on_atrium_area_input_event(_viewport, _event, _shape_idx):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		timertrois.start()


func _on_stjv_area_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_CAN_DROP)


func _on_stjv_area_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)


func _on_atrium_area_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_CAN_DROP)


func _on_atrium_area_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)


func _on_fille_area_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_CAN_DROP)
	
	


func _on_fille_area_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)


func _on_fille_area_input_event(_viewport, _event, _shape_idx):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		DialogueManager.show_dialogue_balloon_scene("res://addons/dialogue_manager/example_balloon/example_balloon.tscn", dialogue, "startmeta")
		audiostream.play()
		timer.start()


func _on_timer_timeout():
	OS.shell_open("https://github.com/Wombat85/Fille-qui-se-racontait-des-histoires")


func _on_timer_2_timeout():
	OS.shell_open("https://toutvrac.itch.io/stjv")


func _on_timer_3_timeout():
	OS.shell_open("https://docs.google.com/presentation/d/e/2PACX-1vT5SB6vkg1B4nL_rhQksLP8p5Ed-ZpiTBcmvDnZQNGVtFM-03IyVcbt789Rc5DWjE9_mAVfJZR9XoJk/pub?start=false&loop=false&delayms=3000")
