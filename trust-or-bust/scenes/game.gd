extends Node2D

## this is the game logic node


@export var characters: Array[PackedScene]
@export var current_character: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_inicialize_character(characters[current_character])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


## this function incialize a character
## and sets document populator
func _inicialize_character(ch: PackedScene): 
	var chara: Node = ch.instantiate()
	chara.position = Vector2(1059.0, 418.0)
	add_child(chara)
	%DocumentPopulator.human = chara.human
