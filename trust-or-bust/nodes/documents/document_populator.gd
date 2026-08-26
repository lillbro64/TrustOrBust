extends Node2D

## This script handles adding the correct documents to the scene. It reads what documents the character
## should have, then adds them to the scene. It should also remove them from the scene once they need to
## be removed.

## TODO this or another script should handle sorting through the z indexes of each document
## they can start in a random order, but when the player clicks one it should go to the "top"
## of the stack, and go one behind when the next one is clicked, and so on
## also, maybe experiment with shrinking documents whey they're not being held?

@onready var id_preload = preload("res://nodes/documents/indentity_card.tscn")
@onready var trust_doc_preload = preload("res://nodes/documents/trust_document.tscn")
@onready var birth_cert_preload = preload("res://nodes/documents/birth_certificate.tscn")

@export var human: Character:
	get:
		return human
	set(value):
		human = value

func add_docs():
	## TODO this if statement should handle randomly populating documents
	## it should read fake_type to decide what documents it can pull from,
	## pick a random amount (like 1 or 2,) and add them
	if(human):
		if human.rand_docs:
			pass
		for i in human.documents:
			var document
			match i:
				"BirthCertificate":
					document = birth_cert_preload.instantiate()
					document.human = human
					document.add_to_group("documents")
					get_tree().current_scene.call_deferred("add_child", document)
				"Bloodwork":
					pass
				"CriminalRecord":
					pass
				"CreditReport":
					pass
					
		var id = id_preload.instantiate()
		id.human = human
		id.add_to_group("documents")
		get_tree().current_scene.call_deferred("add_child", id)
		
		var trust_doc = trust_doc_preload.instantiate()
		trust_doc.human = human
		trust_doc.add_to_group("documents")
		get_tree().current_scene.call_deferred("add_child", trust_doc)
			
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	## I'd like to make this code into a larger function that interates through an array that stores humans
	## It should get rid of the current human's documents, remove the human from the scene, then add the new
	## one and have said human give their documents (documents should be handled by this script,
	## and this script should talk with another that handles humans)
	if Input.is_action_just_pressed("temp_action"):
		for i in get_tree().get_nodes_in_group("documents"):
			i.queue_free()
		add_docs()
	
