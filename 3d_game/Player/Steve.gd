extends KinematicBody

var velocity = Vector3()

const DIAG_SPEED = 10
const SPEED = 10
const ROT_SPEED = 7

func _physics_process(delta: float) -> void:
	
	#to move left and right
	if Input.is_action_pressed("move_right") and Input.is_action_pressed("move_left"):
		velocity.x = lerp(velocity.x, 0, 0.1)
		velocity.x = DIAG_SPEED
	
	elif Input.is_action_pressed("move_right"):
		velocity.x = SPEED
		$MeshInstance.rotate_z(deg2rad(-ROT_SPEED))
	elif Input.is_action_pressed("move_left"):
		velocity.x = -SPEED
		$MeshInstance.rotate_z(deg2rad(ROT_SPEED))
		
	else:
		velocity.x = lerp(velocity.x, 0, 0.1)
		
	#to move forward and backwards
	if Input.is_action_pressed("move_forward") and Input.is_action_pressed("move_backwards"):
		velocity.z = lerp(velocity.z, 0, 0.1)
		velocity.z = DIAG_SPEED
		
	elif Input.is_action_pressed("move_forward"):
		velocity.z = -SPEED
		$MeshInstance.rotate_x(deg2rad(-ROT_SPEED))
	elif Input.is_action_pressed("move_backwards"):
		velocity.z = SPEED
		$MeshInstance.rotate_x(deg2rad(ROT_SPEED))
		
	else:
		velocity.z = lerp(velocity.z, 0, 0.1)
	
	move_and_slide(velocity)
