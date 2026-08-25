extends Resource

## Stores details about the potential trustees the player has to "interview"
class_name IDCard

## Basic details about the person that appear on the ID. In order:
## name is their first and last name, dob is their date of birth, age is their current age,
## hair_color is their hair color, height is their general height (either short, average, or tall,)
## home_city is the city they currently live in, id_num is the number on their ID, for use with
## the Data Scraper, and picture is the picture on the person's ID.
@export var name: String
@export var dob: Date
@export var age: int
@export var hair_color: String
@export var height: String
@export var home_city: String
@export var id_num: String
@export var picture: Texture
