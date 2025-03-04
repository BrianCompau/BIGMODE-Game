extends AnimatedSprite2D

@export var move_speed = 5
var facing_right = false

#0 = idle, 1 = walk 
var anim_state = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Vector2(0,0)
	if Input.is_action_pressed("ui_left"):
		if (facing_right):
			scale.x *= -1
			facing_right = false
		direction.x = -1
	if Input.is_action_pressed("ui_right"):
		if (!facing_right):
			scale.x *= -1
			facing_right = true
		direction.x = 1
	if Input.is_action_pressed("ui_up"):
		direction.y = -1
	if Input.is_action_pressed("ui_down"):
		direction.y = 1
	if (direction == Vector2.ZERO):
		if (anim_state != 0):
			stop()
			anim_state = 0
		play("Idle")
	else:
		if (anim_state != 1):
			stop()
			anim_state = 1
		play("Walk")
	position += direction.normalized() * move_speed
