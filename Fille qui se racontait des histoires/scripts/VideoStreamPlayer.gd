extends VideoStreamPlayer

@onready var btn = %Pause
# Called when the node enters the scene tree for the first time.
func _ready():
	Indices.liste.append("anniv")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_pause_button_down():
	paused = !paused
	if paused:
		btn.text="Lecture"
	else:
		btn.text="Pause"

