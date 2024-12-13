extends Node3D

var xr_interface: XRInterface
var light_color: float
var rgb : Color
@onready var light = $OmniLight3D
@onready var store = get_node("/root/Sliderstore")

func _ready() -> void:
	xr_interface = XRServer.find_interface("OpenXR")
	
	if xr_interface and xr_interface.is_initialized():
		print("OPEN XR started successfully")
		
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED) #all my homies have vsync
		
		get_viewport().use_xr = true
	else:
		print("Open XR has shitted the bed(not working)")

func _process(delta: float) -> void:
	light_color = remap(store.current_pitch, 65,2093,0.0,1.0)
	rgb = Color.from_hsv(light_color,1,0.7)
	light.light_color = rgb
