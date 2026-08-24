extends Resource

class_name Human
## Human is the resource of a person who visits the truster, it has a different thinks that will be 
## spanded during the game developing if needed

## name of human
@export var name: String = "my name"

## surname of human
@export var surname: String = "my surname"

## birth, instead of adding age, i just add the birth day
## in BD a school subject teacher told me to never save the age, i must
## save birth day.
@export var birth_day: Date

## that's the DNI, NIE, National Indentity Card, idk, i use DNI....
## the think its is the DNI picture
@export var picture: Image = load("res://assets/placeholders/textures/hatsune.jpg")
