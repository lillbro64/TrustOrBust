extends CharacterBody2D

signal document_fall

## this function is for detecting documents falling
func _on_area_2d_body_entered(body: Node2D) -> void:
	emit_signal("document_fall")
