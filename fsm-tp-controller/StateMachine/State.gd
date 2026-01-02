class_name State extends Node

@onready var player = get_parent().get_parent()
var fsm : StateMachine

func enter() -> void:
	pass
	
func exit() -> void:
	pass
	
func update(_delta: float) -> void:
	pass
	
func physics_update(_delta:float) -> void:
	pass

func change_state(new_state):
	fsm.change_state(new_state)
