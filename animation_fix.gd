extends StaticBody2D

#used onready here but you should use exports in real projects
@onready var animator = $AnimatedSprite2D
@onready var label = $Label
@onready var animation_smoother = $AnimationSmoother

#required for animation fix
var check := false

#bonus
var	anim_fix_groups = ["bopping","another_animation"]
	
	
func _process(delta):
	
	#text for label: frame num and FPS
	label.text = str(animator.frame+1) + "\n" + \
	str(Engine.get_frames_per_second())
		 
	#hold space or left click to change the animation.
	if Input.is_action_pressed("action"):
		animator.play("bopping")
		check = true
	
#animation fix
###################################################################################
	#checks if the fix is ready to be applied.
	if (animator.frame+1) == animator.sprite_frames.get_frame_count(animator.animation)-1 \
	and check == true and animator.frame_changed and not Input.is_action_pressed("action"):
		check = false
		animation_smoother.wait_time = 1/animator.sprite_frames.get_animation_speed(animator.animation)*delta		
		animation_smoother.start()   #waits required time for smooth transition

#put what happens when the timer ends here.
#You could add transition frames, or just start another animation
func _on_animation_smoother_timeout():
	print(animator.animation)
	
	#checks if animation in list of animations that require fix.
	#don't need this, this is just an example.
	if animator.animation in anim_fix_groups:
		animation_smoother.stop()
		animator.play("idle")		
###################################################################################
