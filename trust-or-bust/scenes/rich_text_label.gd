extends RichTextLabel

## List of available keywords to control your text [br]
## [kbd][c_indent][/c_indent][/kbd] - gives a custom indent to your text. Default is the Undertale indent [br]
## [kbd][ind][/ind][/kbd] - shortcut of the above keyword, except without variable indent. [br]
## [kbd]#[/kbd] - Give an asterisk and a space at the beginning of a string [br]
## [kbd]@[/kbd] - Adds a new line, asterisk, and space [br]
## [kbd]{w=?}[/kbd] - replace "?" with a value to change the speed of the typings

class_name simpleTypewriter

## typing speed
var typingSpeed := 1.0

## emited when finished
signal FinishedTyping

## true if its typing
## false if not (lol)
var isTyping: bool = false

signal press_enter

## end writte is called when writte mode is finished
signal end_writte

## class Pair stores text and if its an order or not
class Pair:
	# False: Its just text
	# True: Its an order 
	var order: bool = false
	var text: String = ""

## the option_buttons
@onready var option_1: Button =  get_tree().root.find_child("Option1", true, false)
@onready var option_2: Button =  get_tree().root.find_child("Option2", true, false)
@onready var option_3: Button =  get_tree().root.find_child("Option3", true, false)

## use it carrefully, its the selected option, it stores here
var selected_option: int = 0

## when the buttons are pressed, it emits a signal called "selected"
signal selected

## Make the text nonvisble
func hideSelf():
	visible = false

## visible true, godot has already this, .show and .hide, but anyways
func showSelf():
	visible = true

func stopTyping():
	$Timer.stop()
	FinishedTyping.emit()


#func _ready() -> void:
	#playDialouge("12{input}[color=GREEN]34 56 7[/color]8[matrix]123456     78[/matrix]9 {input}")

func _input(event: InputEvent) -> void:
	if(Input.is_action_just_pressed("temp_action")):
		emit_signal("press_enter")

## this function process a String and converts it to  Array[Pair]
func _process_text(input: String)-> Array[Pair]:
	var dialoge_text: Array[Pair] = []
	
	## if n_orders == 0, that means is NOT reading orders
	## CAN'T BE lower than ZERO
	var n_orders: int  = 0 
	
	## index is wher text OR order "{" begins 
	## text in pair goes from index to i
	var index: int = 0 
	
	for i in input.length():
		if(input[i] == "{"):
			# get text, as NOT order
			if(n_orders <= 0):
				if(not(index > i - 1)):
					var new_element: Pair = Pair.new()
					new_element.order = false
					new_element.text = input.substr(index, i - index)
					dialoge_text.append(new_element)
				# now let's get new index 
				index = i + 1
			
			n_orders = n_orders + 1
			
		elif(input[i] == "}"):
			n_orders = n_orders - 1
			
			if(n_orders <= 0):
				if(not(index >= i)):
					var new_element: Pair = Pair.new()
					new_element.order = true
					new_element.text = input.substr(index,  (i) - index)
					dialoge_text.append(new_element)
					
				index = i + 1
	if(n_orders <= 0 and not(index >= input.length())):
		var new_element: Pair = Pair.new()
		new_element.order = false
		new_element.text = input.substr(index)
		dialoge_text.append(new_element)
		
	return dialoge_text

## Starts the typing process and sets up the initial variables, also initial
## Visible characters to zero
func writte(input: String):
	typingSpeed = 1
	$Timer.wait_time = 1.0/(float(typingSpeed) * 20.0)
	clear()
	text = ""
	visible_characters = 0
	var dialoge_text: Array[Pair] = _process_text(input)
	#print(input)
	isTyping = true
	visible = true
	
	await _iterate_trhought_pair_array(dialoge_text)
	
	isTyping = false
	emit_signal("FinishedTyping")

## this function is used to iterate througt a pair
func _iterate_trhought_pair_array(dialoge_text: Array[Pair]):
	for i in dialoge_text:
		if(i.order):
			print("----- ORDER -------")
			print(i.text)
			await _do_order(i.text)
		else:
			print("----- TEXT ------")
			print(i.text)
			await _writte_text(i.text)

func _do_order(input: String):
	match input.get_slice("=",0):
		"w":
			typingSpeed = float(input.get_slice("=",1))
			$Timer.wait_time = 1.0/(float(typingSpeed) * 20.0)
		"input":
			await press_enter
		"clear": 
			text = ""
			clear()
			visible_characters = 0
		"option_button_1": 
			option_1.text = input.get_slice("=",1)
			option_1.show()
		"option_button_2": 
			option_2.text = input.get_slice("=",1)
			option_2.show()
		"option_button_3": 
			option_3.text = input.get_slice("=",1)
			option_3.show()
		"await_select":
			await selected
		"if_selected_1":
			if(selected_option == 1):
				await _if_selected(input)
		"if_selected_2":
			if(selected_option == 2):
				await _if_selected(input)
		"if_selected_3":
			if(selected_option == 3):
				await _if_selected(input)

## does the if selected code
func _if_selected(input: String):
				print("---- CONDITION ENTERED, DOING ----")
				var correct_input = ""
				# this function gets all the "="
				for i in input.get_slice_count("="):
					if(i != 0):
						if(i > 1 and i != input.get_slice_count("=")):
							correct_input = correct_input + "="
						correct_input = correct_input +  input.get_slice("=", i)
				print(correct_input)
				var dialoge_text: Array[Pair] = _process_text(correct_input)
				await _iterate_trhought_pair_array(dialoge_text)


func _writte_text(input: String):
	append_text(input)
	$Timer.start()
	await end_writte

func _on_timer_timeout() -> void:
	visible_characters = visible_characters + 1
	if visible_characters < get_parsed_text().length():
		#print("text : " + get_parsed_text())
		if(get_parsed_text()[visible_characters] != " "):
			pass
			#DialougeBeeps.play()
		$Timer.start()
	else:
		print("END")
		$Timer.stop()
		emit_signal("end_writte")

func _on_option_1_pressed() -> void:
	selected_option = 1
	option_1.hide()
	option_2.hide()
	option_3.hide()
	emit_signal("selected")

func _on_option_2_pressed() -> void:
	selected_option = 2
	option_1.hide()
	option_2.hide()
	option_3.hide()
	emit_signal("selected")

func _on_option_3_pressed() -> void:
	selected_option = 3
	option_1.hide()
	option_2.hide()
	option_3.hide()
	emit_signal("selected")
