extends Control

@onready var store = get_node("/root/Sliderstore")

@onready var pitch_slider = $pitch
@onready var vib_slider =$vibrato
@onready var vib2_slider =$vibrato2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pitch_slider.connect("value_changed", Callable(self,"pitch_change"))
	pitch_slider.connect("value_changed", Callable(self,"vib_change"))
	pitch_slider.connect("value_changed", Callable(self,"vib_change2"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func pitch_change(value):
	store.set_pitch(value)
	
func vib_change(value):
	store.set_vib(value)
	
func vib_change2(value):
	store.set_vib2(value)
