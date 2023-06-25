extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (float) var speed = 200
var motion = Vector2(0.0, 0.0)

# Called when the node enters the scene tree for the first time.
func _ready():
	z_index = global_position.y
	
func _physics_process(delta):
	move_and_collide(motion * delta * speed)

func _process(delta):
	z_index = global_position.y
	var k_u = false
	var k_d = false
	var k_l = false
	var k_r = false
	if Input.is_action_pressed("ui_up"):
		k_u = true
	if Input.is_action_pressed("ui_down"):
		if k_u:
			k_u = false
			k_d = false
		else:
			k_d = true
	if Input.is_action_pressed("ui_left"):
		k_l = true
	if Input.is_action_pressed("ui_right"):
		if k_l:
			k_l = false
			k_r = false
		else:
			k_r = true
	motion = Vector2(0.0, 0.0)
	if k_l:
		motion.x = -0.707 if k_u or k_d else -1.0
	elif k_r:
		motion.x = 0.707 if k_u or k_d else 1.0
	if k_u:
		motion.y = -0.707 if k_l or k_r else -1.0
	elif k_d:
		motion.y = 0.707 if k_l or k_r else 1.0
	
	var m = 'walk'
	if Input.is_key_pressed(KEY_X):
		speed = 300
		m = 'run'
	else:
		speed = 160
	
	$sprite.play_move(k_l, k_r, k_u, k_d, m)
