extends Node

var pitch_slider: float = 0.0
var vib_slider:float =0.0
var current_pitch:float =0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_vib(value: float):
	vib_slider = value
	
func set_pitch(value: float):
	pitch_slider = value

func set_cur_pitch(value: float):
	current_pitch = value
