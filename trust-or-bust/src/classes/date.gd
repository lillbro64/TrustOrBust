extends Resource

class_name Date
## Date has a day, a mothn an the year

# 14/10/05 is my birthay - Ticoloi

## day
@export var day: int = 14

## moth, numerical
@export var month: int = 10

## year
@export var year: int = 2005

## this function returns month between date1 and date2, to calculate age
## TODO
func monthsBetween(dob: Date, date2: Date) -> int: 
	# fun fact: SQL uses this function to calculate years between two dates
	var age = date2.year - dob.year
	if dob.month > date2.month:
		age -= 1
	elif dob.month == date2.month:
		if dob.day > date2.day:
			age -= 1
	return age

# train
#
#                                     (@@@)     (@@@@@)
#                               (@@)     (@@@@@@@)        (@@@@@@@)
#                         (@@@@@@@)   (@@@@@)       (@@@@@@@@@@@)
#                    (@@@)     (@@@@@@@)   (@@@@@@)             (@@@)
#               (@@@@@@)    (@@@@@@)                (@)
#           (@@@)  (@@@@)           (@@)
#        (@@)              (@@@)
#       .-.               
#       ] [    .-.      _    .-----.
#      ."   """"   """""" """"| .--`
#     (:--:--:--:--:--:--:--:-| [___    .------------------------.
#     |C&O  :  :  :  :  :  : [_9_] |'='|.----------------------.|
#    /|.___________________________|___|'--.___.--.___.--.___.-'| 
#   / ||_.--.______.--.______.--._ |---\'--\-.-/==\-.-/==\-.-/-'/--
#  /__;^=(==)======(==)======(==)=^~^^^ ^^^^(-)^^^^(-)^^^^(-)^^^ jgs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
