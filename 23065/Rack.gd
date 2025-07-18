extends CharacterBody2D

@export var speed = 150
@export var dash = 10000
@export var jump_speed = -1000
@export var gravity = 2000

var rackonfloor

var dashcooldown = false

var sprinting = false

var attacking = false

var combo = 0

var combocooldown = false

var m1cooldown = false

func comboreset():
	if Input.is_action_just_pressed("Space") and sprinting == false:
		
		if combo == 1:
			await get_tree().create_timer(1).timeout
			if combo == 1:
				combo = 0
				attacking = false
		elif combo == 2:
			await get_tree().create_timer(1).timeout
			if combo == 2:
				combo = 0
				attacking = false
		elif combo == 3:
			await get_tree().create_timer(1).timeout
			if combo == 3:
				combo = 0
				attacking = false
		else:
			pass
		
	
	
func directions():
	if Input.is_action_just_pressed("walk_left"):
		transform.x.x = 1
	elif Input.is_action_just_pressed("walk_right"):
		transform.x.x = -1
 

func _physics_process(delta):
	# Add gravity every frame
	
	velocity.y += gravity * delta
	
	if Input.is_action_pressed("Shift"):
		sprinting = true
		speed = 400
		velocity.x = Input.get_axis("walk_left", "walk_right") * speed
	else:
		sprinting = false
		speed = 200
		velocity.x = Input.get_axis("walk_left", "walk_right") * speed
		
	if sprinting and Input.is_action_just_pressed("Space") and dashcooldown == false:
		velocity.x = Input.get_axis("walk_left", "walk_right") * dash
		Cooldown(2)
	if is_on_floor() == true:
		rackonfloor = true
	elif is_on_floor() == false:
		rackonfloor = false
	move_and_slide()
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_speed
func Cooldown(time):
	dashcooldown = true
	await get_tree().create_timer(time).timeout
	dashcooldown = false
	
func attack():
	
	if Input.is_action_just_pressed("Space") and sprinting == false and combocooldown == false and m1cooldown == false:
		
		if combo == 0:
			Global.Rackattack = 1
			combo = 1
		elif combo == 1:
			Global.Rackattack = 2
			combo = 2
		elif combo == 2:
			Global.Rackattack = 3
			combo = 3
		elif combo == 3:
			Global.Rackattack = 4
			combo = 4
		elif combo == 4:
			combo = 0
			combocooldown = true
			await get_tree().create_timer(1).timeout
			combocooldown = false
		print(combo)
	if Input.is_action_just_pressed("Space") and sprinting == false and combocooldown == false and m1cooldown == false:
		attacking = true
		await get_tree().create_timer(0.1).timeout
		attacking = false
		m1cooldown = true
		await get_tree().create_timer(0.1).timeout
		m1cooldown = false
		
func  _process(_delta):
	attack()
	comboreset()
	directions()
