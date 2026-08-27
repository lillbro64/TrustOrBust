extends Node2D

signal anim_complete
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func switch_sprite(new_sprite: String):
	$Sprite2D.texture = load(new_sprite)
	
func anim_handler(anim_to_play: String):
	$AnimationPlayer.play(anim_to_play)
	await $AnimationPlayer.animation_finished
	anim_complete.emit()
