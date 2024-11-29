# Animation-Fix
The following Godot 4.3 code demonstrates a way to have an animation end when you want rather than instantly, whilst remaining smooth. I made this since snappy animations (for example going from running to idle) feel off in many games, and are often quite distracting. This fix is easy to implement, and works well with state machines as well as simple systems.

### The fix works as follows:
1. To prime the fix, set check = true. For example, when the animation that you want to transition from afterwards is playing.
2. When certain conditions are met, the fix is started. My conditions are:
* Check is true,
* The second to last frame is active,
* the frame has just been changed,
* The action button is not being pressed.
3. Check is set to false to stop the statement endlessly repeating.
4. The wait time of a timer is set using the animation speed and delta, then the timer is started.
6. After the timer ends, the "_on_animation_smoother_timeout" function activates, which holds the logic for animation changing.
7.The timer is stopped and the animation is switched.

### To make the fix work with a state machine:
1. On entry to a state, set check = true.
2. Put the code for step 2-4 in the state's update function. I'd recommend checking if the previous state was one that you want the animation fix to work for unless you want to use it with every animation (... and PLAYER_INFORMATION.last_state in anim_fix_group).
3. Do the remaining steps as usual.

If you want to make the animations even smoother, you could create transition frames that play after the fix completes.



### Credit to Brackeys for the pixel art font used.
