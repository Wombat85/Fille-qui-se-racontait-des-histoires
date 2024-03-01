extends Node2D

@onready var dialogue = load("res://dialogues/remarques.dialogue")
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	var liste = Indices.liste
	liste.append("crochet")
	DialogueManager.show_dialogue_balloon_scene("res://addons/dialogue_manager/example_balloon/example_balloon.tscn", dialogue, "startcroch")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



