extends State
var stand_height := 2.0
const JUMP_VELOCITY :float= 4.5

func enter() -> void:
	pass
	
func physics_update(_delta:float) -> void:
	if player.is_on_floor():
		player.velocity.y = JUMP_VELOCITY
	player.move_and_slide()
	
	if player.movement != Vector3.ZERO:
		change_state("move")
		
	if player.velocity.y == 0.0:
		change_state("idle")

func exit() -> void:
	pass
