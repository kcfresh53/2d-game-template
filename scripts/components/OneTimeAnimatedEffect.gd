## Creates one time animations
# Credit to HeartBeast - MIT License code
class_name OnetimeAnimatedEffect

## This effect exports animated sprite so we can give it a sprite frames resource (to animate the effect)
## and so we can connect to the animation_finished signal to free it
extends AnimatedSprite2D

func _ready() -> void:
	# Free this node when the animation is finished
	animation_finished.connect(queue_free)
	animation_looped.connect(queue_free)
