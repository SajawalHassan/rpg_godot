extends KinematicBody2D

onready var animated_sprite: AnimatedSprite = $AnimatedSprite

const UP_DIRECTION: Vector2 = Vector2.UP

export var speed: int = 200

var velocity: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	var horizontal_input = (Input.get_action_strength("right") - Input.get_action_strength("left"))
	var vertical_input = (Input.get_action_strength("down") - Input.get_action_strength("up"))
	
	velocity.x = horizontal_input
	velocity.y = vertical_input
	
	move_and_slide(velocity.normalized() * speed)
	
	if Input.is_action_pressed("right"):
		animated_sprite.animation = "right"
		animated_sprite.flip_h = false
	elif Input.is_action_just_released("right"):
		animated_sprite.animation = "right_idle"
		animated_sprite.flip_h = false

	elif Input.is_action_pressed("left"):
		animated_sprite.animation = "right"
		animated_sprite.flip_h = true
	elif Input.is_action_just_released("left"):
		animated_sprite.animation = "right_idle"
		animated_sprite.flip_h = true

	elif Input.is_action_pressed("up"): animated_sprite.animation = "up"
	elif Input.is_action_just_released("up"): animated_sprite.animation = "up_idle"
	
	elif Input.is_action_pressed("down"): animated_sprite.animation = "down"
	elif Input.is_action_just_released("down"): animated_sprite.animation = "down_idle"
