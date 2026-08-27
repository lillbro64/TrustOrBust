@tool
extends CharacterBody2D

## only true if mouse inside
var mouse_inside: bool = false

## mouse_position_NOW
var current_mouse_position: Vector2

var holding = false

@export var mass: float = 1

@export var human: Character:
	get:
		return human
	## Fills in ID Card with person's details.
	set(value):
		%IDImage.texture = value.id_pic
		%IDName.text = value.name
		%IDCardNum.text = %IDCardNum.text.replacen("!IDNUM", str(value.id_num))
		%IDDOB.text = %IDDOB.text.replacen("!MONTH", str(value.dob.month))
		%IDDOB.text = %IDDOB.text.replacen("!DAY", str(value.dob.day))
		%IDDOB.text = %IDDOB.text.replacen("!YEAR", str(value.dob.year))
		%IDAge.text = %IDAge.text.replacen("!AGE", str(value.age))
		%IDHairC.text = %IDHairC.text.replacen("!HAIRC", value.hair_color)
		%IDHeight.text = %IDHeight.text.replacen("!HEIGHT", value.height)
		%IDHome.text = %IDHome.text.replacen("!CITY", value.home_city)
		
		## each fake one has another idcard, the correct one, (idk if its necessary)
		#if !value.is_child:
			#pass
			## TODO figure out how the fuck to change the texture to a different one when the trustee
			## is fake, the solution below does not work as get_theme_stylebox seems to only return
			## StyleBoxFlat, which does not have a texture
			#var fake_id: StyleBoxTexture = $PanelContainer.get_theme_stylebox("StyleBoxTexture").duplicate()
			#fake_id.texture = load("res://assets/placeholders/textures/TempFakeID.png")
			#$PanelContainer.add_theme_stylebox_override("normal", fake_id)
			
		
		human = value

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	## WARNING DO NOT DELETE OR COMMENT OUT BELOW LINE OF CODE, EDITOR WILL SPAM ERRORS
	if Engine.is_editor_hint(): return
	
	## Currently, the game will check if you are hovering over an ID when you click, and if both are true, you'll
	## pick up the ID, and only drop it when you release click. Something will have to be created to keep the ID
	## within certain bounds (ideally, leaving the game window with it should drop it.)
	if(mouse_inside and Input.is_action_just_pressed("l-click")):
		holding = true
		$AnimationPlayer.play("grow")
	if Input.is_action_just_released("l-click") and holding:
		holding = false
		$AnimationPlayer.play("shrink")
	if holding:
		var mouse_pos: Vector2 = get_global_mouse_position()
		move_and_collide(- current_mouse_position + mouse_pos)
	else:
		move_and_collide(get_gravity()*mass*delta)
	
	# current_mouse_pos
	current_mouse_position = get_global_mouse_position()

## The document is no longer here (disappears)
func goodbye():
	$CollisionShape2D.disabled = true

func _on_panel_container_mouse_entered() -> void:
	#print("mouse inside me")
	mouse_inside = true

func _on_panel_container_mouse_exited() -> void:
	#print("mouse outside me")
	mouse_inside = false
