extends CollisionShape2D

func _ready():
	position = Vector2(-144.5, 76)
func _process(_delta_):
	if  Rack.attacking == false:
		%punchhitbox.set_deferred("disabled", true)
	else:
		%punchhitbox.set_deferred("disabled", false)
	if Rack.combocooldown == true:
		%punchhitbox.set_deferred("disabled", true)
