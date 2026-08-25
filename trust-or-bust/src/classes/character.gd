extends Resource

## Character is the character woh enters the scene,
## a character has a sprite, a True IDCARD and a fake id card
class_name Character

## True id card
@export var true_id_card: IDCard

## Fake IDcard
@export var fake_id_card: IDCard


## is_child determines whether or not they are one of the players children (i.e. a trustee, somebody who SHOULD
## be awarded with trust fund money.) If true, the game should auto-fill Beff Jezos in as one of the parents,
## and only one other parent should be named.
@export var is_child: bool
@export var parents: Array[String]

## fake_type stores what kind of faker they are. 0 is real, 1 is moron, 2 is pretender, 3 is impersonator,
## 4 is spy. The type will determine what info will be fake (although all but real and spies may have some
## elements randomly fake, such as a misspelled name/wrong age or DOB)
@export var fake_type: int

## criminal_record is a record of the crimes (if any) the person has committed. financial_record is
## a record of purchases the person has undertaken.
@export var criminal_record: Array[String]
@export var financial_record: Array[Purchase]


## special_records stores any special records (e.g. family photo, record of employment, etc.) that may
## be associated with the person. These will be relatively rare, only possessed by real people and spies.
@export var special_records: Array
