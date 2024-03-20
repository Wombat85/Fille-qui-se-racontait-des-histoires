extends Area2D

@onready var animated = %Lecteuranimation
@onready var timer = %Timer
@onready var timer2 = %Timer2
@onready var timer3 = %Timer3
@onready var timer4 = %Timer4
@onready var timer5 = %Timer5
@onready var timer6 = %Timer6
@onready var bruit_tiroir = %bruit_tiroir
@onready var bruit_porte = %bruit_porte
@onready var bruit_imprimante = %bruit_imprimante
# Called when the node enters the scene tree for the first time.
func _ready():
	var main = load("res://art/icone-de-la-main-rouge.png")
	Input.set_custom_mouse_cursor(main, Input.CURSOR_CROSS)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_CROSS)


func _on_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)


func _on_input_event(_viewport, _event, _shape_idx):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var mp = get_global_mouse_position()
		if (mp.x >=310 && mp.x <=425) && (mp.y >=90 && mp.y <=132):
			timer2.start()
			animated.play("imprimante")
			bruit_imprimante.play()
		elif (mp.x >=450 && mp.x<=500) && (mp.y >=50 && mp.y <=136):
			get_tree().change_scene_to_file("res://scenes/edition.tscn")
		elif (mp.x >470 && mp.x<=531) && (mp.y >=285 && mp.y <=324):
			get_tree().change_scene_to_file("res://scenes/manette.tscn")
		elif (mp.x >=720 && mp.x<=830) && (mp.y>=180 && mp.y<=210):
			get_tree().change_scene_to_file("res://scenes/feuille.tscn")
		elif (mp.x >=710 && mp.x<=785) && (mp.y >=230 && mp.y <=252):
			get_tree().change_scene_to_file("res://scenes/cahier.tscn")
		elif (mp.x >=740 && mp.x<=829) && (mp.y >=370 && mp.y <=394):
			timer.start()
			animated.play("ouverture_tiroir")
			bruit_tiroir.play()
		elif (mp.x >=740 && mp.x<=833) && (mp.y >=430 && mp.y <=460):
			timer3.start()
			animated.play("ouverture_tiroir_deux")
			bruit_tiroir.play()
		elif (mp.x >=740 && mp.x<=833) && (mp.y >=490 && mp.y <=520):
			timer4.start()
			animated.play("ouverture_tiroir_trois")
			bruit_tiroir.play()
		elif (mp.x >=740 && mp.x<=833) && (mp.y >=540 && mp.y <=579):
			timer5.start()
			animated.play("ouverture_tiroir_quatre")
			bruit_tiroir.play()
		elif (mp.x >=410 && mp.x<=450) && (mp.y >=440 && mp.y <=554):
			timer6.start()
			bruit_porte.play()
			animated.play("porte")
		elif (mp.x >=610 && mp.x<=690) && (mp.y >=450 && mp.y <=563):
			get_tree().change_scene_to_file("res://scenes/crochet.tscn")

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/tiroir_ouvert.tscn")


func _on_timer_2_timeout():
	get_tree().change_scene_to_file("res://scenes/imprimante.tscn")


func _on_timer_3_timeout():
	get_tree().change_scene_to_file("res://scenes/tiroir_deux_ouvert.tscn")


func _on_timer_4_timeout():
	get_tree().change_scene_to_file("res://scenes/tiroir_trois_ouvert.tscn")


func _on_timer_5_timeout():
	get_tree().change_scene_to_file("res://scenes/tiroir_quatre_ouvert.tscn")


func _on_timer_6_timeout():
	get_tree().change_scene_to_file("res://scenes/societe.tscn")
