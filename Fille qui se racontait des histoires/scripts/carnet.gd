extends Node2D

@onready var images = get_tree().get_nodes_in_group("images")
@onready var theatre = %theatre
@onready var crochet = %crochet
@onready var colo = %colo
@onready var societe = %societe
@onready var jeuxvideo = %jeuxvideo
@onready var gestion = %gestion
@onready var BU = %BU
@onready var lafilleecrit = %lafilleecrit
@onready var editrice = %éditrice
@onready var liste = Indices.liste
@onready var dialogue = load("res://dialogues/carnet.dialogue")
@onready var dialogueinterface = load("res://dialogues/balloon.tscn")
@onready var dialogueinterface4 = load("res://dialogues/balloon4.tscn")
@onready var dialogueinterface8 = load("res://dialogues/balloon8.tscn")
@onready var dialogueinterface5 = load("res://dialogues/balloon5.tscn")
@onready var dialogueinterface2 = load("res://dialogues/balloon2.tscn")
@onready var dialogueinterface6 = load("res://dialogues/balloon6.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_default_cursor_shape()
	for image in images:
		image.hide()
	if liste.has("OKanniv"):
		colo.show()
	elif liste.has("anniv"):
		DialogueManager.show_dialogue_balloon_scene(dialogueinterface4, dialogue, "start4")
		liste.append("OKanniv")
	if liste.has("OKcrochet"):
		crochet.show()
	elif liste.has("crochet"):
		DialogueManager.show_dialogue_balloon_scene(dialogueinterface8, dialogue, "start8")
		liste.append("OKcrochet")
	if liste.has("OKmanuscrit"):
		lafilleecrit.show()
	elif liste.has("manuscrit"):
		DialogueManager.show_dialogue_balloon_scene(dialogueinterface, dialogue, "start1")
		liste.append("OKmanuscrit")
	if liste.has("OKnabuccho"):
		societe.show()
	elif liste.has("nabuccho"):
		DialogueManager.show_dialogue_balloon_scene(dialogueinterface5, dialogue, "start5")
		liste.append("OKnabuccho")
	if liste.has("OKtheatre"):
		theatre.show()
	elif liste.has("theatre"):
		DialogueManager.show_dialogue_balloon_scene(dialogueinterface2, dialogue, "start2")
		liste.append("OKtheatre")
	if liste.has("OKjeuxvideos"):
		jeuxvideo.show()
	elif liste.has("jeuxvideos"):
		DialogueManager.show_dialogue_balloon_scene(dialogueinterface6, dialogue, "start6")
		liste.append("OKjeuxvideos")

