extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_jouer_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_crédits_pressed():
	get_tree().change_scene_to_file("res://scenes/crédits.tscn")


func _on_quitter_pressed():
	get_tree().quit()
