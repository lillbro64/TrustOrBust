extends Resource

## Character is the character woh enters the scene,
## a character has a sprite, a True IDCARD and a fake id card
class_name Character

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
@export var id_pic: Texture

## TODO for some reason, the character sprite doesn't seem to switch when this is a texture itself
## fix that in the character_portrait script, then change this back to being a texture
## for now, just use filepath
@export var chara_sprite: String

## is_child determines whether or not they are one of the players children (i.e. a trustee, somebody who SHOULD
## be awarded with trust fund money.) If true, the game should auto-fill Beff Jezos in as one of the parents,
## and only one other parent should be named.
@export var is_child: bool

@export var parents: Array[String]

@export var trust_reason: String

## fake_type stores what kind of faker they are. 0 is real, 1 is moron, 2 is pretender, 3 is impersonator,
## 4 is spy. The type will determine what info will be fake (although all but real and spies may have some
## elements randomly fake, such as a misspelled name/wrong age or DOB)
@export var fake_type: int

## criminal_record is a record of the crimes (if any) the person has committed. financial_record is
## a record of purchases the person has undertaken.
@export var criminal_record: Array[String]
@export var financial_record: Array[Purchase]

## documents are whatever documents the person will provide. ID and trust documentation is universal,
## so do not add it to a character's document array. rand_docs will randomize what documentation
## a character brings in lieu of setting it manually. This will give it docs depending on type of fake
## (real, moron, pretender, impersonator, spy,)

## Valid document types: BirthCertificate, Bloodwork, CriminalRecord, CreditReport
@export var documents: Array[String]
@export var rand_docs: bool

## special_records stores any special records (e.g. family photo, record of employment, etc.) that may
## be associated with the person. These will be relatively rare, only possessed by real people and spies.
@export var special_records: Array

## caller 1
@export var caller_1: Caller
## caller 2
@export var caller_2: Caller
## caller 3
@export var caller_3: Caller
