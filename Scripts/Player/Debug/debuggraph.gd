extends VBoxContainer
@onready var fps: Label = $fps
@onready var state: Label = $state
@onready var state_machine: StateMachine = $"../StateMachine"

func _process(delta: float) -> void:
	fps.text = "fps: " + str(Engine.get_frames_per_second())
	state.text = "player_state: " + str(state_machine.current_state)
