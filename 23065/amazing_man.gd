extends CharacterBody2D
@export var gravity = 2000
@onready var detectleft = $detectleftA
@onready var detectright = $detectrightA
@onready var gethit = $GetHit
func _ready() -> void:
	detectright.body_entered.connect(_on_body_entered)
	detectright.body_exited.connect(_on_body_exited)
	detectleft.body_entered.connect(_on_body_entered)
	detectleft.body_exited.connect(_on_body_exited)
	gethit.connect("amazingfreedom", Callable(self, "freedom"))
func _on_body_entered(body: Node) -> void:
	print("Body entered:", body.name)

func _on_body_exited(body: Node) -> void:
	print("Body exited:", body.name)
	
func freedom():
	queue_free()
func _physics_process(delta):
	# Add gravity every frame
	velocity.y += gravity * delta
	move_and_slide()
