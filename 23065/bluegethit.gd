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
	#print("I entered ", by_area.name)
	if Rack.combo == 1:
		Bluehealth -=10
	elif Rack.combo == 2:
		Bluehealth -= 10
	elif Rack.combo == 3:
		Bluehealth -= 10
	elif Rack.combo == 4:
		Bluehealth -= 20
	print("BLUE", Bluehealth)
func _process(_delta):
	if Bluehealth <= 0:
		print("blue die")
		emit_signal("freedom")
		
		free()
