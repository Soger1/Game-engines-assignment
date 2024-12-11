extends Node3D

func _ready():
	var xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.initialize():
		# Set viewport to XR
		get_viewport().use_xr = true
		
		# Try setting blend mode using different potential methods
		if "environment_blend_mode" in xr_interface:
			# Try setting to transparent or alpha blend mode
			xr_interface.environment_blend_mode = 1  # Typically represents alpha/transparent
		
		# Create XR Origin
		var xr_origin = XROrigin3D.new()
		add_child(xr_origin)
		
		# Add XR Camera
		var xr_camera = XRCamera3D.new()
		xr_origin.add_child(xr_camera)
		
		# Create a transparent object to test AR
		var ar_cube = MeshInstance3D.new()
		var cube_mesh = BoxMesh.new()
		ar_cube.mesh = cube_mesh
		
		# Create transparent material
		var material = StandardMaterial3D.new()
		material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		material.albedo_color = Color(1, 0, 0, 0.5)  # Transparent red
		ar_cube.material_override = material
		
		# Position cube in front of camera
		ar_cube.position = Vector3(0, 0, -1)  # 1 meter in front
		ar_cube.scale = Vector3(0.3, 0.3, 0.3)
		
		xr_origin.add_child(ar_cube)
		
		print("AR setup complete")
	else:
		print("Failed to initialize OpenXR")
