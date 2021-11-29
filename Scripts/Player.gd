extends KinematicBody2D

export var gravity = 10000
export var speed = 10100
var jump_speed = 5000
func _ready():
	$AnimatedSprite.animation = "idle"
	$AnimatedSprite.playing = true
func getVelocity():
	var direction = Vector2.ZERO
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
		$AnimatedSprite.animation = "run"
		$AnimatedSprite.flip_h = false
		fall()
	elif Input.is_action_pressed("ui_left"):
		direction.x -= 1
		$AnimatedSprite.animation = "run"
		$AnimatedSprite.flip_h = true
		fall()
	else:
		$AnimatedSprite.animation = "idle"
		fall()
	if Input.is_action_pressed("ui_up") && is_on_floor() :
		direction.y = -900
	direction.x *= speed
	direction.y = (direction.y)
	return direction
func fall():
	if !is_on_floor():
		$AnimatedSprite.animation = "fall"

func _process(delta):
	var velocity = getVelocity()
	move_and_slide(velocity, Vector2.UP)
