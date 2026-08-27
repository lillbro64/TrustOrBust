extends RichTextLabel

signal finish

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func writte(t: String):
	text = t
	visible_characters = 0
	$Timer.start()

func _on_timer_timeout() -> void:
	if(visible_characters == text.length()):
		emit_signal("finish")
		$Timer.stop()
	else:
		visible_characters = visible_characters + 1
