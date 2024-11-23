extends Node

var stump_scene = preload("res://stump.tscn")
var stone_scene = preload("res://stone.tscn")
var barrel_scene = preload("res://barrel.tscn")
var bird_scene = preload("res://bird.tscn")
var obstacle_types := [stump_scene, barrel_scene, stone_scene]
var obstacles : Array
var bird_height := [200, 390]

const DINO_START_POS := Vector2i(96,544)
const CAM_START_POS := Vector2i(576,325)
var score : int

var speed : float
const START_SPEED : float = 1
const MAX_SPEED : int = 5
const SPEED_MOD : int = 5000

var screen_size : Vector2i
var game_running : bool = false
var last_obs
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_window().size
	new_game()

func new_game():
	score = 0
	show_score()
	$Dino.position = DINO_START_POS
	$Dino.velocity = Vector2i(0,0)
	$Camera2D.position = CAM_START_POS
	$Ground.position = Vector2i(0,614)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if game_running:
		speed = START_SPEED + score / SPEED_MOD
		if speed > MAX_SPEED:
			speed = MAX_SPEED
			
		generate_obs()
		
		$Dino.position.x += speed
		$Camera2D.position.x += speed
		
		score += speed
		show_score()
		
		if $Camera2D.position.x - $Ground.position.x > screen_size.x * 1.5:
			$Ground.position.x += screen_size.x
	else :
		if Input.is_action_pressed("ui_accept"):
			game_running = true
			$HUD.get_node("StartLabel").hide()

func generate_obs():
	if obstacles.is_empty():
		
				
func show_score():
	$HUD.get_node("ScoreLabel").text = "Score: " + str(score)
	
	
	
	
	
	
	
	
	
	
