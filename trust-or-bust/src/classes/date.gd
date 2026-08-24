extends Resource

class_name Date
## Date has a day, a mothn an the year

## day
@export var day: int = 14

## moth, numerical
@export var month: int = 10

## year
@export var year: int = 2005

## this function returns month between date1 and date2, to calculate age
## TODO
func monthsBetween(date1: Date, date2: Date) -> int: 
	var month1: int = date1.month
	var month2: int = date2.month
	
	return 0
