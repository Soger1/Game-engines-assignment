extends Node3D

var xr_interface: XRInterface

func _ready():
	# Initialize OpenXR interface
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface:
		# Initialize the interface
		if xr_interface.initialize():
			get_viewport().use_xr = true
			print("OpenXR initialized successfully")
			
			# Debug information
			print_xr_interface_info()
		else:
			print("Failed to initialize OpenXR")
	else:
		print("OpenXR interface not found")

func setup_vr_scene():
	# Create XR Origin
	var xr_origin = XROrigin3D.new()
	add_child(xr_origin)
	
	# Create XR Camera
	var xr_camera = XRCamera3D.new()
	xr_origin.add_child(xr_camera)
	
	# Create XR Controllers
	var left_controller = XRController3D.new()
	left_controller.tracker = "left_hand"
	xr_origin.add_child(left_controller)
	
	var right_controller = XRController3D.new()
	right_controller.tracker = "right_hand"
	xr_origin.add_child(right_controller)

func print_xr_interface_info():
	if xr_interface:
		print("OpenXR Interface Diagnostic Information:")
		
		# Print available methods
		print("\nAvailable Methods:")
		var methods = xr_interface.get_method_list()
		for method in methods:
			print(method["name"])
		
		# Print available properties
		print("\nAvailable Properties:")
		var properties = xr_interface.get_property_list()
		for prop in properties:
			print(prop["name"])
		
		# Basic interface capabilities
		print("\nInterface Capabilities:")
		print("Is Initialized: ", xr_interface.is_initialized())

		# Attempt to get capabilities safely
		try_get_capabilities()

func try_get_capabilities():
	# Safely attempt to check interface capabilities
	var has_method_get_capabilities = xr_interface.has_method("get_capabilities")
	if has_method_get_capabilities:
		var capabilities = xr_interface.get_capabilities()
		print("Interface Capabilities: ", capabilities)
	else:
		print("Cannot retrieve interface capabilities")

# Detailed explanation about VR setup
func explain_vr_setup():
	print("""
Valve Index OpenXR Setup Guide:
--------------------------------
1. Ensure SteamVR is running
2. Verify OpenXR runtime is installed
3. Check Godot OpenXR module compatibility
4. Troubleshooting steps:
   - Update SteamVR
   - Reinstall OpenXR runtime
   - Check Godot OpenXR plugin version
""")
