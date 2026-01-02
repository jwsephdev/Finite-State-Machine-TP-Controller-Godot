extends State
var stand_height := 2.0
func enter() -> void:
	pass

func physics_update(_delta:float) -> void:
	
	if player.movement:
		player.visuals.look_at(player.position + player.direction)

	if player.is_on_floor():
		player.velocity.x = player.direction.x * player.speed
		player.velocity.z = player.direction.z * player.speed
	else:
		player.velocity.x = lerp(player.velocity.x, player.direction.x * player.speed, _delta*5.0)
		player.velocity.z = lerp(player.velocity.z, player.direction.z * player.speed, _delta*5.0)
	player.move_and_slide()
	
	if player.movement == Vector3.ZERO:
		change_state("idle")
	if Input.is_action_just_pressed("ui_accept") and player.is_on_floor():
		change_state("jump")
		
func exit() -> void:
	pass
