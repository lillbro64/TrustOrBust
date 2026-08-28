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

@onready var character_handler = get_tree().root.find_child("CharacterHandler", true, false)

@onready var text_writter: RichTextLabel = get_tree().root.find_child("RichTextLabel", true, false)

@onready var accept_button: Button =  get_tree().root.find_child("Accept", true, false)
@onready var denny_button: Button =  get_tree().root.find_child("Denny", true, false)
@onready var begin_button: Button =  get_tree().root.find_child("Begin", true, false)


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
	text_writter.writte("Whelcome to the game!")
	await text_writter.finish
	print("end")
	begin_button.show()

## so, if you spawn the space documents may appear twice or MORE
## that's why i control it with this bool.
## ITS NOT the best solution, but it works
var can_temp: bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	## I'd like to make this code into a larger function that interates through an array that stores humans
	## It should get rid of the current human's documents, remove the human from the scene, then add the new
	## one and have said human give their documents (documents should be handled by this script,
	## and this script should talk with another that handles humans)
	if Input.is_action_just_pressed("temp_action") and can_temp:
		# To provenent double calling
		pass
		#_next_character()

## this function is for the temp think
func _next_character():
	 # All the documents have a ""cool"" animation
	if(can_temp):
		can_temp = false
		for i in get_tree().get_nodes_in_group("documents"):
			i.goodbye()
		
		# cool animation for character
		character_handler.bye_character()
		await character_handler.anim_complete
		
		# removes docs
		for i in get_tree().get_nodes_in_group("documents"):
			i.queue_free()
			# and the next character will appear 
		character_handler.init_character()
		await character_handler.anim_complete
		
		# adds the docs
		add_docs()
		
		# And now you can temp again
		can_temp = true


func _on_accept_pressed() -> void:
	_next_character()


func _on_denny_pressed() -> void:
	_next_character()


func _on_begin_pressed() -> void:
	_next_character()
	begin_button.hide()
	accept_button.show()
	denny_button.show()

## at the begginning of the game, a text will say hell o!
func _on_rich_text_label_finish() -> void:
	pass # Replace with function body.

## this controls if we are on a call or not
var is_on_a_call: bool = false

## call function
func _call():
	if(!is_on_a_call):
		is_on_a_call = true

## phone riiing 
func _on_phone_riiiing() -> void:
	_call()
