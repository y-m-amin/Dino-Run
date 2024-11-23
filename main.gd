extends Node

const DINO_START_POS := Vector2i(96,544)
const CAM_START_POS := Vector2i(576,325)
var score : int

var speed : float
const START_SPEED : float = 0.8
const MAX_SPEED : int = 5
var screen_size : Vector2i

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_window().size
	new_game()

func new_game():
	score = 0
	$Dino.position = DINO_START_POS
	$Dino.velocity = Vector2i(0,0)
	$Camera2D.position = CAM_START_POS
	$Ground.position = Vector2i(0,614)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	speed = START_SPEED
	
	$Dino.position.x += speed
	$Camera2D.position.x += speed
	
	score += speed
	
	if $Camera2D.position.x - $Ground.position.x > screen_size.x * 1.5:
		$Ground.position.x += screen_size.x
