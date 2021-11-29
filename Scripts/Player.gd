extends KinematicBody2D

export (int) var gravity = 1000
export (int) var speed = 200
export (int) var jump_speed = -380

var velocity = Vector2.ZERO

var jumped = false

# press sprint to speed up a bit
func sprint():
	if Input.is_action_pressed("sprint"):
		speed = 300
	else:
		speed = 200

func _ready():
	$AnimatedSprite.animation = "idle"
	$AnimatedSprite.playing = true

# gets direction (this bit is a huge mess, but it works)
func get_direction():
	velocity.x = 0
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
		if !jumped:
			$AnimatedSprite.animation = "run"
		$AnimatedSprite.flip_h = false
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed
		if !jumped:
			$AnimatedSprite.animation = "run"
		$AnimatedSprite.flip_h = true
	if velocity.x == 0 && is_on_floor() && !jumped:
		$AnimatedSprite.animation = "idle"

func fall():
	if !jumped && !is_on_floor():
		$AnimatedSprite.animation = "fall"

func jump():
	if Input.is_action_pressed("ui_up"):
		if is_on_floor():
			velocity.y = jump_speed
			$AnimatedSprite.animation = "jump"
			jumped = true
			$JumpTimer.start()

func _process(delta):
	get_direction()
	sprint()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	jump()
	fall()

# used a timer so the fall animation wouldn't play
func _on_JumpTimer_timeout():
	jumped = false
