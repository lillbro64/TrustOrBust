extends CharacterBody2D


## This signal is when someone rings
signal  riiiing

## gravitiy
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	move_and_slide()

## emits riiiing
func _on_button_pressed() -> void:
	emit_signal("riiiing")

## if its on floor, it "jumps"
func _on_table_document_fall() -> void:
	if(is_on_floor()):
		move_and_collide(Vector2(0,-50))
