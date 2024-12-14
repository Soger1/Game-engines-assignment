extends XROrigin3D

var pitch_range = Vector2(65, 2093)  # Hz range
var volume_range = Vector2(0, 1)     # Volume range
@onready var audio_stream_player = $AudioStreamGenerator
@onready var left_controller = $Left
@onready var right_controller = $Right
@onready var store = get_node("/root/Sliderstore")

var current_pitch = 440.0  # A4 note
var current_volume = 0.0
var pitch_rod_pos = Vector3(-1, 1.5, 0)
var volume_controller_pos = Vector3(0, 1, 0)

# Sound generation variables
var phase = 0.0
var sample_rate = 44100  # Standard audio sample rate

# Vibrato variables
var vibrato_speed = 1.0  # Vibrato speed in Hz
var vibrato_depth = 30.0  # Vibrato depth in Hz
var vibrato_phase = 0.0


func _ready():
	# Setup AudioStreamGenerator
	if audio_stream_player:
		var stream = AudioStreamGenerator.new()
		stream.mix_rate = sample_rate
		stream.buffer_length = 0.1  # 100ms buffer
		audio_stream_player.stream = stream
		audio_stream_player.play()
	
	# Verify controller references
	if not left_controller:
		push_error("Left controller not found!")
	if not right_controller:
		push_error("Right controller not found!")

func _process(delta):
	# Only proceed if both controllers and audio player are valid
	if not left_controller or not right_controller or not audio_stream_player or not audio_stream_player.stream:
		print("Missing required nodes, cannot generate audio.")
		return
	
	# Get controller positions
	var left_pos = left_controller.global_transform.origin
	var right_pos = right_controller.global_transform.origin
	
	vibrato_depth = store.vib_slider
	
	# Update pitch - highest pitch when closest to the rod
	# Invert the lerp to make pitch highest when closest to the rod
	if left_pos.x > pitch_rod_pos.x:
		current_pitch = lerp(
			pitch_range.y+store.pitch_slider,  # Highest pitch
			pitch_range.x+store.pitch_slider,  # Lowest pitch
			clamp(left_pos.x-pitch_rod_pos.x, 0, 1)
		)
	
	# Update volume - lowest when closest to the volume controller
	if right_pos.y > volume_controller_pos.y:
		# Calculate distance from volume controller, then invert it
		var distance_to_volume = abs(right_pos.y - volume_controller_pos.y)
		current_volume = (distance_to_volume / 2.0)
		current_volume = clamp(current_volume, volume_range.x, volume_range.y)
	
	# Vibrato calculation
	vibrato_phase += vibrato_speed * delta

		
	
	var vibrato_effect = sin(vibrato_phase * 2 * PI) * vibrato_depth
	var pitch_with_vibrato = current_pitch + vibrato_effect
	
	# Fill audio buffer
	var playback = audio_stream_player.get_stream_playback()
	
	# Generate audio samples
	while playback.can_push_buffer(1):
		# Generate sine wave
		phase += (2 * PI * pitch_with_vibrato) / sample_rate
		if phase > 2 * PI:
			phase -= 2 * PI
		var sine_wave = sin(phase)
		var tri_wave = 2.0 * abs(1.0 - fmod(phase / (2 * PI), 2.0)) - 1.0
		var sample = (sine_wave * 0.7 + tri_wave * 0.3) * current_volume
		sample =  atan(sample * 2.0) / 2.0
		store.set_cur_pitch(pitch_with_vibrato)
		playback.push_frame(Vector2(sample, sample))
