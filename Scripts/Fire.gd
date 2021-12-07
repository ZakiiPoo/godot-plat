extends StaticBody2D

var fire_on = true

func _ready():
	$AnimatedSprite.playing = true
	$Timer.start()

func switch():
	if fire_on:
		$AnimatedSprite.animation = "on"
	else:
		$AnimatedSprite.animation = "off"

func _process(_delta):
	switch()

func _on_Timer_timeout():
	if fire_on:
		fire_on = false
	else:
		fire_on = true


func _on_Area2D_body_entered(body):
	if body.name == "Player" && fire_on:
		body.queue_free()
