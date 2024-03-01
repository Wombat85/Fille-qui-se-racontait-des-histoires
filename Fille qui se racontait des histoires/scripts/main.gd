extends Node2D

func _ready() -> void:
	$Book.show_book("book", 4)
	var main = load("res://art/icone-de-la-main-rouge.png")

	Input.set_custom_mouse_cursor(main, Input.CURSOR_POINTING_HAND)#pass # Replace with function body.
	

