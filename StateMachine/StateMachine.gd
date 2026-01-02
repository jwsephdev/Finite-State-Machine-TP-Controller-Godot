class_name StateMachine extends Node

var states :Dictionary[String, State]= {}
var current_state
@export var initial_state: State

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			
			child.fsm = self
			
			
	if initial_state:
		initial_state.enter()
		current_state = initial_state
	
func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)

func change_state(new_state_name: String) -> void:
	var new_state: State = states.get(new_state_name.to_lower())
	
	assert(new_state, "State not Found: " + new_state_name) 
	
	if current_state:
		current_state.exit()
		
	new_state.enter()
	
	current_state = new_state
