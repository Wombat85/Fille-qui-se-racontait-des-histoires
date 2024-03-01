#warning-ignore-all:return_value_discarded
extends NinePatchRect


class_name Book 

@export var duration := 0.8
@export var border_width := 30

@onready var time := 0.0
@onready var n := 0
@onready var pages_dir := "."
@onready var max_page := 0
@onready var flipping := false
@onready var imgs := [0, 0]

@onready var page := $Clipper/Page
@onready var slider := $Clipper/Slider

#@onready var scale := $Book.scale
@onready var x_max := 0.0
@onready var y_max := 0.0
@onready var dragging := false
@onready var drag_pos := Vector2(0, 0)
@onready var Texte1 := %Texte1
@onready var Texte2 := %Texte2

#@onready var main := load("res://icone-de-la-main-noire.png")

func _ready() -> void:
#	Input.set_custom_mouse_cursor(main)
#	Input.set_custom_mouse_cursor(main, Input.CURSOR_POINTING_HAND)
##pas
	page.material.set_shader_parameter("time", 0)
	page.material.set_shader_parameter("flip_duration", duration)
	page.material.set_shader_parameter("cylinder_ratio", 0.3)
	page.material.set_shader_parameter("rect", page.size)
	$Clipper.connect("gui_input", Callable(self, "_on_book_input"))
	$Clipper/Left.connect("gui_input", Callable(self, "_on_input").bind(true))
	$Clipper/Left.connect("mouse_entered", Callable(self, "_on_mouse").bind(true, true))
	$Clipper/Left.connect("mouse_exited", Callable(self, "_on_mouse").bind(true, false))
	$Clipper/Right.connect("gui_input", Callable(self, "_on_input").bind(false))
	$Clipper/Right.connect("mouse_entered", Callable(self, "_on_mouse").bind(false, true))
	$Clipper/Right.connect("mouse_exited", Callable(self, "_on_mouse").bind(false, false))
	_border($Clipper/Left, true)
	_border($Clipper/Right, false)
	_slider(false)
	slider.visible = false
	slider.self_modulate.a = 0.5

func show_book(dir : String, pages : int) -> void:
	pages_dir = dir
	max_page = pages - 1
	_reset(0, 0, duration + 1)
	visible = true
	
	

func _border(what : Control, left : bool) -> void:
	what.custom_minimum_size.x = border_width
	what.size = Vector2(border_width, page.size.y)
	what.position = Vector2(0,0)
	if not left:
		what.position.x = page.size.x - border_width

func _slider(left : bool) -> void:
	slider.size = Vector2(border_width, page.size.y)
	slider.custom_minimum_size.x = border_width
	var img := slider.get_child(0)
	img.position = Vector2(0, (slider.size.y - img.size.y) / 0.5)
	if left:
		slider.position.x = 0
		img.flip_h = true
	else:
		slider.position.x = page.size.x -border_width
		img.flip_h = false
		img.position.x = slider.size.x - slider.get_child(0).size.x

func _process(delta : float) -> void:
	if flipping:
		time += delta
		page.material.set_shader_parameter("time", time)
		if time > duration:
			flipping = false
		
func _reset(a : int, b : int, dt : float) -> void:
	n = b
	imgs[0] = load("res://%s/%02d.png" % [pages_dir, a])
	imgs[1] = load("res://%s/%02d.png" % [pages_dir, b])
	page.material.set_shader_parameter("current_page", imgs[0])
	page.material.set_shader_parameter("next_page", imgs[1])
	if n == 0:
		slider.visible = false
	if n == max_page:
		slider.visible = false
	time = dt
	flipping = (dt == 0.0)
	if n == 1:
		Texte1.play()
		
	if n == 2:
		Texte1.stop()
		Texte2.play()
	if n == 3:
		Texte2.stop()
		get_tree().change_scene_to_file("res://scenes/bureau.tscn")
		
		
func _on_mouse(left : bool, entered : bool) -> void:
	if (left and n == 0) or (not left and n == max_page):
		return
	_slider(left)
	if entered:
		slider.visible = true
	else:
		slider.visible = false
		
func _on_input(event : InputEvent, left : bool) -> void:
	if (left and n == 0) or (not left and n == max_page):
		return
	if event is InputEventMouseButton and event.is_pressed():
		if left:
			_on_prev()
		else:
			_on_next()

func _on_prev() -> void:
#	Sound.page_flip()
	page.material.set_shader_parameter("flip_left", false)
	page.material.set_shader_parameter("cylinder_direction", Vector2(5.0, -1.0))
	_reset(n, n - 1, 0.0)

func _on_next() -> void:
#	Sound.page_flip()
	page.material.set_shader_parameter("flip_left", true)
	page.material.set_shader_parameter("cylinder_direction", Vector2(5.0, 1.0))
	_reset(n, n + 1, 0.0)
	
	

func _on_book_input(event : InputEvent) -> void:
	if event is InputEventMouseButton:
		accept_event()
	var moved := false
	var scaled := false
	if dragging and (event is InputEventMouseMotion or event is InputEventScreenDrag):
		
		if n > 0 and event.relative.x > 30:
			dragging = false
			_on_prev()
		if n < max_page and event.relative.x < - 30:
			dragging = false
			_on_next()
		else:
			page.position += event.relative * scale
			moved = true
	if event is InputEventMouseButton:
		var idx = event.button_index
		var pressed := event.is_pressed()
		if idx == 0 or idx == 1:
#			if (pressed and not $Timer.is_stopped()) or event.doubleclick:
#				if scale == 1:
#					scale = 2
#				else:
#					scale = 1
#				scaled = true
#				$Timer.stop()
			dragging = pressed
			drag_pos = get_global_mouse_position()
		elif (idx == 4 or idx == 5) and event.is_pressed():
			var v = page.scale.x
			if idx == 4:
				v += 0.1
			if idx == 5:
				v -= 0.1
			v = clamp(v, 1, 2)
			scale = v
			scaled = true
	if scaled:
		x_max = page.size.x - page.size.x * scale
		y_max = page.size.y - page.size.y * scale
#		page.scale = Vector2(scale, scale)
#		$Clipper/Left.visible = (scale == 1)
#		$Clipper/Right.visible = (scale == 1)
	if moved or scaled:
		page.position.x = clamp(page.position.x, x_max, 0)
		page.position.y = clamp(page.position.y, y_max, 0)





func _on_texte_2_finished():
	get_tree().change_scene_to_file("res://bureau.tscn")
#	OS.shell_open("https://prezi.com/view/k14lX8CVf1iuHFGx9UBB/")





