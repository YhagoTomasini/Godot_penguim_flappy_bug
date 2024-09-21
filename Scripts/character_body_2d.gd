extends CharacterBody2D

const GRAVITY : int = 1000
const MAX_SPEED : int = 1000
const JUMP_VELOCITY : int = -500
var flying : bool = false
var falling : bool = false
const START_POS = Vector2(100, 400)

func _ready():
	reset()
	
func reset():
	falling = false
	flying = false
	position = START_POS
	set_rotation(0)
	
func _physics_process(delta):
	if flying or falling:
		velocity.y += GRAVITY * delta
		
		if velocity.y > MAX_SPEED:
			velocity.y = MAX_SPEED
		
		if flying:
			set_rotation(deg_to_rad(velocity.y * 0.05))
			$AnimatedSprite2D.play()
		elif falling:
			set_rotation(PI/2)
			$AnimatedSprite2D.stop()
		move_and_collide(velocity * delta)
	
	else:
		$AnimatedSprite2D.stop()
		
func flap():
	velocity.y = JUMP_VELOCITY
