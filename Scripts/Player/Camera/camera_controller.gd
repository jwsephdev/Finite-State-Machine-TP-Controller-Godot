extends Node

@onready var player = get_parent()
@export var cam_sens := 0.1

@onready var camera_mount: Node3D = $"../camera_mount"
@onready var camera: Camera3D = $"../camera_mount/camera_springarm/camera"
@onready var visuals: Node3D = $"../visuals"


func camera_controls(event):
	if event is InputEventMouseMotion:
		player.rotate_y(deg_to_rad(-event.relative.x) * cam_sens)
		visuals.rotate_y(deg_to_rad(event.relative.x) * cam_sens)
		camera_mount.rotate_x(deg_to_rad( -event.relative.y) * cam_sens)
		camera_mount.rotation.x = clamp(camera_mount.rotation.x, deg_to_rad(-70), deg_to_rad(15))

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	camera_controls(event)
