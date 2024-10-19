extends Node3D

var xr_interface: XRInterface

func _ready() -> void:
	xr_interface = XRServer.find_interface("OpenXR")
	
	if xr_interface and xr_interface.is_initialized():
		print("OPEN XR started successfully")
		
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED) #all my homies have vsync
		
		get_viewport().use_xr = true
	else:
		print("Open XR has shitted the bed(not working)")
