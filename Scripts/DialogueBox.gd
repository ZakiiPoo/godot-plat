extends Control
var thingsToSay = ["Hey, welcome to the game!", "Hike", "RIKE", "E0S"]
 
func write(toWrite):
	if(toWrite != "E0S"):
		$Text.text = "\t" + toWrite
	else:
		visible = false

var x = 0

func _input(event):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.is_pressed():
		write(thingsToSay[x])
		x = x + 1
