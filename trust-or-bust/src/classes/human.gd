extends Resource

## Stores details about the potential trustees the player has to "interview"
class_name Human

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

## is_child determines whether or not they are one of the players children (i.e. a trustee, somebody who SHOULD
## be awarded with trust fund money.) If true, the game should auto-fill Beff Jezos in as one of the parents,
## and only one other parent should be named.
@export var is_child: bool
@export var parents: Array[String]

## fake_type stores what kind of faker they are. 0 is real, 1 is moron, 2 is pretender, 3 is impersonator,
## 4 is spy. The type will determine what info will be fake (although all but real and spies may have some
## elements randomly fake, such as a misspelled name/wrong age or DOB)
@export var fake_type: int

## TODO Create a resource for purchases that stores what the transaction was and how much was spent/gained
## criminal_record is a record of the crimes (if any) the person has committed. financial_record is
## a record of purchases the person has undertaken.
@export var criminal_record: Array[String]
@export var financial_record: Array[Purchase]

## TODO Create/dictate specific special records
## special_records stores any special records (e.g. family photo, record of employment, etc.) that may
## be associated with the person. These will be relatively rare, only possessed by real people and spies.
@export var special_records: Array
