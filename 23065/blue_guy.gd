extends CharacterBody2D
@export var gravity = 2000

func _ready():
	$attackbox.connect("relayfreedom", Callable(self, "_on_relay_freedom"))
func _on_relay_freedom():
	queue_free()
func _physics_process(delta):
	# Add gravity every frame
	
	velocity.y += gravity * delta
	move_and_slide()
