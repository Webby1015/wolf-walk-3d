extends RigidBody3D
@onready var pause_menu: Control = $TwistPivot/PitchPivot/Camera3D/PauseMenu
@onready var twist_pivot: Node3D = $TwistPivot
@onready var pitch_pivot: Node3D = $TwistPivot/PitchPivot
@onready var animation_player: AnimationPlayer = $"TwistPivot/Wolf-model/AnimationPlayer"


var baseStrantgh := 1200.0
var paused := false
var mouse_sensitivity := 0.001
var twist_input := 0.0
var pitch_input := 0.0

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta: float) -> void:
	
	var input := Vector3.ZERO
	#input.x = Input.get_axis("right","left")
	input.z = Input.get_axis("backward","forward")
	
	twist_pivot.rotate_y(twist_input)
	pitch_pivot.rotate_x(pitch_input)
	pitch_pivot.rotation.x = clamp(pitch_pivot.rotation.x,deg_to_rad(-25),deg_to_rad(10))
	twist_input = 0.0
	pitch_input = 0.0 
	
	if !paused:
		apply_central_force(twist_pivot.basis * input * baseStrantgh * delta)
		if input.length_squared() > 0.01: # Check if there's significant input
			if animation_player.current_animation != "01_Run_Armature_0":
				animation_player.play("01_Run_Armature_0")
		else:
			if animation_player.current_animation != "05_site_Armature_0":
				animation_player.play("05_site_Armature_0")
	if Input.is_action_just_pressed("Pause"):
		pausemenu()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion && Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		twist_input = -event.relative.x * mouse_sensitivity
		pitch_input = -event.relative.y * mouse_sensitivity

func pausemenu() -> void:
	if paused : 
		pause_menu.hide()
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		#Engine.time_scale = 1
	else : 
		pause_menu.show()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		#Engine.time_scale = 0
		
	paused = !paused
