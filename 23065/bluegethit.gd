extends Area2D

signal freedom

var Bluehealth = 50
var last_notifier: Area2D = null
func _on_body_entered(body):
	print("hit")
	if body.name == "Rack" and Rack.attacking == true:
		Bluehealth -=25
		print(Bluehealth)

func _on_special_area_entered(by_area: Area2D) -> void:
	last_notifier = by_area
	print("I entered ", by_area.name)
	Bluehealth -= 25
	print("BLUE", Bluehealth)
func _process(_delta):
	if Bluehealth <= 0:
		print("blue die")
		emit_signal("freedom")
		
		free()
