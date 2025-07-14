extends CharacterBody2D
@export var gravity = 2000
@export var speed = 200
@onready var detectleft = $detectleft
@onready var detectright = $detectright
var direction = 0
func _ready():
	$attackbox.connect("relayfreedom", Callable(self, "_on_relay_freedom"))
	$detectright.connect("goright", Callable(self, "go_right"))
	$detectleft.connect("goleft", Callable(self, "go_left"))
	$detectright.connect("stopright", Callable(self, "stop_right"))
	$detectleft.connect("stopleft", Callable(self, "stop_left"))
func _on_relay_freedom():
	queue_free()
func go_right():
	direction = 1
func go_left():
	direction = -1
func stop_right():
	direction = 0
func stop_left():
	direction = 0
func _physics_process(delta):
	# Add gravity every frame
	if direction == 1:
		velocity.x = speed
	elif direction == -1:
		velocity.x = speed * -1
	else:
		velocity.x = 0
	velocity.y += gravity * delta
	move_and_slide()
