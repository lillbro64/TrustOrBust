extends Node2D

## this is the game logic node


@export var characters: Array[Character]
@export var current_character: int = 0

@onready var document_populator = get_tree().root.find_child("DocumentPopulator", true, false)

var chara
signal anim_complete


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	chara = get_tree().root.find_child("Character", true, false)
	prints(str(chara))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func bye_character():
	chara.anim_handler("bye")
	await chara.anim_complete
	anim_complete.emit()

func init_character(): 
	if chara.visible:
		chara.switch_sprite(characters[current_character].chara_sprite)
		chara.anim_handler("appear")
		await chara.anim_complete
		anim_complete.emit()
