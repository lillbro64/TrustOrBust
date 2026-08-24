@tool
extends CharacterBody2D

## only true if mouse inside
var mouse_inside: bool = false

## mouse_position_NOW
var current_mouse_position: Vector2



@export var mass: float = 1

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


func _physics_process(delta: float) -> void:
	
	# Mouse part
	
	if(mouse_inside and Input.is_action_pressed("click")):
		var mouse_pos: Vector2 = get_global_mouse_position()
		move_and_collide(- current_mouse_position + mouse_pos)
	else:
			move_and_collide(get_gravity()*mass*delta)
	
	# current_mouse_pos
	current_mouse_position = get_global_mouse_position()
	
	




func _on_panel_container_mouse_entered() -> void:
	print("mouse inside me")
	mouse_inside = true

func _on_panel_container_mouse_exited() -> void:
	print("mouse outside me")
	mouse_inside = false
