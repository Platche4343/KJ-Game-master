extends AnimatedSprite2D

func _process(_delta):
	if Input.is_action_pressed("walk_left") or Input.is_action_pressed("walk_right"):
		if Rack.sprinting == false and Rack.attacking == false:
			%Animations.play("walk")
	else:
			%Animations.play("idle")
