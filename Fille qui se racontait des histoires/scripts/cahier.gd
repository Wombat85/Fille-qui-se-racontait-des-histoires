extends Node2D

@onready var liste = Indices.liste
@onready var milletapes = get_tree().get_nodes_in_group("milletapes")
@onready var histoires = get_tree().get_nodes_in_group("histoires")
@onready var plannings = get_tree().get_nodes_in_group("plannings")
@onready var qualites = get_tree().get_nodes_in_group("qualites")
@onready var handicaps = get_tree().get_nodes_in_group("handicaps")
# Called when the node enters the scene tree for the first time.
func _ready():
	liste.append("gestion")
	for milletape in milletapes:
		milletape.hide()
	for histoire in histoires:
		histoire.hide()
	for planning in plannings:
		planning.hide()
	for qualite in qualites:
		qualite.hide()
	for handicap in handicaps:
		handicap.hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_milletapes_mouse_entered():
	for milletape in milletapes:
		milletape.show()


func _on_milletapes_mouse_exited():
	for milletape in milletapes:
		milletape.hide()


func _on_quetedhistoire_mouse_entered():
	for histoire in histoires:
		histoire.show()


func _on_quetedhistoire_mouse_exited():
	for histoire in histoires:
		histoire.hide()


func _on_planningbiblio_mouse_entered():
	for planning in plannings:
		planning.show()


func _on_planningbiblio_mouse_exited():
	for planning in plannings:
		planning.hide()


func _on_qualite_mouse_entered():
	for qualite in qualites:
		qualite.show()


func _on_qualite_mouse_exited():
	for qualite in qualites:
		qualite.hide()

func _on_handicaps_mouse_entered():
	for handicap in handicaps:
		handicap.show()


func _on_handicaps_mouse_exited():
	for handicap in handicaps:
		handicap.hide()
