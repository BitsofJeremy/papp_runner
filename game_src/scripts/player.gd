extends CharacterBody2D

const GRAVITY : int = 4200
const JUMP_SPEED : int = -1200

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	if is_on_floor():
		if not get_parent().game_running:
			print("idle")
			# TODO Create AnimatedSprite2D Animations
			#$AnimatedSprite2D.play("idle")
		else:
			$CollisionShape2D.disabled = false
			if Input.is_action_pressed("ui_accept"):
				velocity.y = JUMP_SPEED
				$JumpSound.play()
			elif Input.is_action_pressed("ui_down"):
				print("duck")
				# TODO Create AnimatedSprite2D Animations
				#$AnimatedSprite2D.play("duck")
				#$CollisionShape2D.disabled = true
			else:
				print("run")
				# TODO Create AnimatedSprite2D Animations
				#$AnimatedSprite2D.play("run")
	else:
		print("jump")
		# TODO Create AnimatedSprite2D Animations
		#$AnimatedSprite2D.play("jump")
		
	move_and_slide()
