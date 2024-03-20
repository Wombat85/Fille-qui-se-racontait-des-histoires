extends Node2D

@onready var dialogue = load("res://dialogues/remarques.dialogue")
# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.show_dialogue_balloon_scene("res://addons/dialogue_manager/example_balloon/example_balloon.tscn", dialogue, "startenv")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

