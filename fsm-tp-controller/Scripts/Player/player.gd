class_name Player extends CharacterBody3D

@onready var visuals: Node3D = $visuals
@onready var camera_springarm: SpringArm3D = $camera_mount/camera_springarm
@export var lerp_speed :float= 10.0

var speed :float= 6.0
var input_dir : Vector2
var direction :Vector3
var movement :Vector3

func _physics_process(delta: float) -> void:
	input_dir = Input.get_vector("a", "d", "w", "s")
	direction = lerp(direction,(transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized(),delta*lerp_speed)
	movement = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if not is_on_floor():
		velocity += get_gravity() * delta
