class_name StateBase extends Node

## referencia al nodo que vamos a controlar
var character3D:Player # @onready var player:Player = self.owner

## referencia a la maquina de estados
var state_machine:MachineCharacter

#region métodos comunes

## método que se ejecuta al entrar en el estado
func start():
	pass
	
## método que se ejecuta al abandonar el estado
func end():
	pass

#endregion
