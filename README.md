# Guy-Vs-Guy-Template
A godot project template that allows users to modify and and give copies to eachother, made to make life easier to people who wants to be famous, or just want to make characters for fun.

Documentation:

How to Create a Character:
Duplicate the Scene file from The Character Template or The Playable one and rename the file when a warning pops-up, Remove the Script from the root node, Rename the root node, create a new script and name is whatever you want, in the Script change that it extends from a CharacterBody2D to "Template" or "PlayableTemplate", and thats it, you have a Character.

Changing Sprite:

On the Player Node(AnimationPlayer2D) go to reset and delete the first keyframe and go to the idle and delete the keyframe too, then change the sprites texture (Sprite2D) to any asset in the project folder, on the animation player idle animation, click on the keyframe side-by-side with the texture, make sure that you also create it in the Reset Animation, thats it.

Adding Hitboxes:

Go to your character and add a area2d and shape it how you like, then connect "Body Entered" To the Root node, on it before "Pass" write "if body.is_in_group("Characters") and body!=self:"
and thats it.

More Functions Info:

GameFunc.freeze(seconds): Freeze the game with the amount of [seconds]

GameFunc.play_sound(): plays a sound without cutting off, make sure to add .stream after the AudioStreamPlayer node name, example: GameFunc.play_sound($Explosion.stream) (Explosion is AudioStreamPlayer, nodes name)

GameFunc.quit(seconds): quits the game after [seconds] amount of time, set to 0 to be instant.

HITBOX FUNCTIONS:

knockback(dirx,diry): sets the openent velocity.x to dirx and velocity.y to diry

damage(damage): reduces health by [damage] amount of health and displays it.

flash(boolean): flashes the character by 0.05 seconds, if the boolean is true, plays a default hitsound, set it to false to not play anything.

Misc:
dir: it is the general sprite2d direction towards the opponent, great for knockback() or velocity
