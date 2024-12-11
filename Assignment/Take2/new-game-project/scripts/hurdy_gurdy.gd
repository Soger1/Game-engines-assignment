extends Node3D

# Hurdy Gurdy Mechanics
var crank_rotation = 0.0
var key_pressed = {}
var drone_volume = 0.0
var melody_volume = 0.0

func _ready():
	# Initialize instrument components
	setup_instrument_components()

func _process(delta):
	update_crank_rotation(delta)
	handle_key_interactions()
	update_sound_generation()

func update_crank_rotation(delta):
	# Simulate crank rotation based on VR controller input
	var controller_input = get_node("VRController").get_crank_rotation()
	crank_rotation += controller_input * delta

func handle_key_interactions():
	# Track which keys are pressed in VR
	var vr_controller = get_node("VRController")
	for key_node in get_tree().get_nodes_in_group("keys"):
		if vr_controller.is_key_touched(key_node):
			key_pressed[key_node.name] = true
		else:
			key_pressed[key_node.name] = false

func update_sound_generation():
	# Generate sound based on crank rotation and key presses
	var drone_audio = get_node("DroneAudioStreamPlayer")
	var melody_audio = get_node("MelodyAudioStreamPlayer")
	
	# Calculate drone and melody volumes
	drone_volume = calculate_drone_volume()
	melody_volume = calculate_melody_volume()
	
	drone_audio.volume_db = linear2db(drone_volume)
	melody_audio.volume_db = linear2db(melody_volume)

func calculate_drone_volume():
	# Logic for drone string volume based on crank rotation
	return clamp(abs(crank_rotation), 0.0, 1.0)

func calculate_melody_volume():
	# Logic for melody string volume based on key presses
	var active_keys = key_pressed.values().count(true)
	return clamp(float(active_keys) / 10.0, 0.0, 1.0)

func setup_instrument_components():
	# Initial setup of hurdy gurdy components
	pass
