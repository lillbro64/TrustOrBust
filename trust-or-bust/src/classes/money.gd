extends Resource

## Money is a class that stores and amount and money type
class_name Money

@export var amount: float = 0.00

enum TYPE  {
	EURO,
	DOLLAR
}

@export_enum("Money.TYPE") var type: int

func get_money_symbol(money: Money):
	if(money.type == Money.TYPE.EURO):
		return "€"
	else:
		return "$"
