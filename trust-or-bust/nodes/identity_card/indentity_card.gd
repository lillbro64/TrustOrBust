@tool
extends Node2D

@export var human: Human:
	get:
		return human
	set(value):
		%IDImage.texture = value.picture
		%IDName.text = value.name
		human = value

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
