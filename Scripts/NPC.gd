extends KinematicBody2D

var is_in = false
var talking

func _ready():
	$Area2D/Eicon.visible = false
	$AnimationPlayer.animation_set_next("New Anim", "bob")
	$AnimatedSprite.playing = true

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		is_in = true
		$Area2D/Eicon.visible = true
		$AnimationPlayer.play("New Anim")

func _process(_delta):
	talking = Dialogic.get_variable("talking")
	if Input.is_action_pressed("ui_e") && is_in && talking == "false":
			var new_dialog = Dialogic.start('testTimeLine') 
			add_child(new_dialog)


func _on_Area2D_body_exited(body):
	if body.name == "Player":
		is_in = false
		$Area2D/Eicon.visible = false
