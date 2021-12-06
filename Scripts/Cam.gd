extends Camera2D



func _on_Right_body_entered(body):
	if body.name == "Player":
		position.x += 950



func _on_Left_body_entered(body):
	if body.name == "Player":
		position.x -= 950
