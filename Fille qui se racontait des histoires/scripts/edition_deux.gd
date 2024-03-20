extends Node2D

@onready var dialogue = load("res://dialogues/remarques.dialogue")
@onready var timer = %Timer
@onready var canvaslayer= %CanvasLayer
@onready var canvas = get_tree().get_nodes_in_group("canvas")
@onready var liste = Indices.liste
# Called when the node enters the scene tree for the first time.
func _ready():
	liste.append("edition")
	for canva in canvas :
		canva.hide()
	DialogueManager.show_dialogue_balloon_scene("res://addons/dialogue_manager/example_balloon/example_balloon.tscn", dialogue, "startedition")
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_timer_timeout():
	canvaslayer.visible = true
	canvaslayer = %CanvasLayer2
	timer.start()
