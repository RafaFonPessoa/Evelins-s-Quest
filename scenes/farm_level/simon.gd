extends Node2D

const MAX_ROUNDS = 5

var colorSequence : Array = []
var playerInput : Array = []



func _ready():
	TransitionScreen._fade_out()
	await get_tree().create_timer(1).timeout
	TransitionScreen.hide()

func start_game(round_num):
	#Clear player Input
	playerInput.clear()
	
	colorSequence.clear()
	for i in range(round_num):
		# Add random color to sequence 1 is red, 2 is green and 3 is blue
		colorSequence.append(randi_range(1,3))
	
	show_sequence()

func show_sequence():
	for color_index in colorSequence:
		 # Light the button
		$Label2.visible = true
		light_button(color_index)
		await get_tree().create_timer(1).timeout
	
	$Label2.visible = false
	playerInput.clear()

func light_button(colors):
	match colors:
		1:
			print("Red")
			$Red.modulate = Color(1,0,0)
			$RedButton.play()
			await get_tree().create_timer(0.5).timeout
			$Red.modulate = Color.hex(0x4e4e4e)
		2:
			print("Green")
			$Green.modulate = Color.hex(0xffffff)
			$GreenButton.play()
			await get_tree().create_timer(0.5).timeout
			$Green.modulate = Color.hex(0x4e4e4e)
		3:
			print("Blue")
			$Blue.modulate = Color.hex(0xffffff)
			$BlueButton.play()
			await get_tree().create_timer(0.5).timeout
			$Blue.modulate = Color.hex(0x4e4e4e)

# Buttons Pressed
func _on_blue_pressed():
	playerInput.append(3)
	
	check_input()

func _on_green_pressed():
	playerInput.append(2)
	check_input()

func _on_red_pressed():
	playerInput.append(1)
	
	check_input()

func check_input():
	
	if playerInput.size() < colorSequence.size():
		return
	
	if playerInput == colorSequence:
		if colorSequence.size() == MAX_ROUNDS:
			game_over(true)
		else:
			await get_tree().create_timer(0.5).timeout
			var newSequence = colorSequence.size() + 1
			print("Rodada numero: ", newSequence)
			$Label.text = "Rodada: " + str(newSequence)
			start_game(newSequence)
	else :
		# If player fail 
		game_over(false)


func game_over(player_won):
	if player_won:
		print("You Won!")
		TransitionScreen.show()
		get_tree().change_scene_to_file("res://scenes/farm_level/viillage.tscn")
	else:
		print("You fail!")
		$GameOver.visible = true


func _on_button_pressed():
	$Tutorial.visible = false
	await get_tree().create_timer(1).timeout
	start_game(1)


func _on_reset_pressed():
	$GameOver.visible = false
	await get_tree().create_timer(1).timeout
	start_game(1)
