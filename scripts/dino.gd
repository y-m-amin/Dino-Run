extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -1000
const GRAVITY :int = 1400

func _physics_process(delta: float) -> void:
	
	velocity.y += GRAVITY * delta
	
	if is_on_floor():
		if not get_parent().game_running:
			$AnimatedSprite2D.play("idle")
		else :
			$RunCol.disabled = false
			if Input.is_action_just_pressed("ui_accept") :
				velocity.y = JUMP_VELOCITY
				$AudioStreamPlayer.play()
				
			elif Input.is_action_pressed("ui_down"):
				$AnimatedSprite2D.play("duck")
				$RunCol.disabled = true
			else:
				$AnimatedSprite2D.play("run")
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	else:
		$AnimatedSprite2D.play("jump")
		

	move_and_slide()
