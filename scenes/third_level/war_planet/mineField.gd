extends Node2D

const ROWS : int = 14
const COLS : int = 15
const CELL_SIZE : int = 32

var tile_id : int = 1

var mine_layer : int = 0
var number_layer : int = 1
var grass_layer : int = 2
var flag_layer : int = 3
var hover_layer : int = 4

var mine_coords := []

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

func new_game():
	clear()
	mine_coords.clear()
	generate_mines()

func generate_mines():
	pass
