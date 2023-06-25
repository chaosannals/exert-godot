extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func play_move(l, r, u, d, m='walk'):
	if l:
		play(m + "-left")
	elif r:
		play(m + "-right")
	elif u:
		play(m + "-up")
	elif d:
		play(m + "-down")
	else:
		frame = 0
		stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
