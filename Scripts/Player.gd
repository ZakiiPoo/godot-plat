extends KinematicBody2D

export var gravity = 12000
export var speed = 10100
var jump_speed = 50000
func _ready():
	$AnimatedSprite.animation = "idle"
	$AnimatedSprite.playing = true
	
func getVelocity():
	var veliocity = Vector2.ZERO
	return veliocity
func fall():
	if !is_on_floor():
		$AnimatedSprite.animation = "fall"

func _process(delta):
	var velocity = getVelocity()
	move_and_slide(velocity * delta, Vector2.UP)
