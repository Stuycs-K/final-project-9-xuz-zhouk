# Work Log

## GROUP MEMBER 1: Zhi Ming Xu

### date: 5-22-23
worked alongside Kevin to provide him with insights,  
implemented gravity and movement for fruits

### date: 5-23-2023
worked on implementing rotation of fruit  

### date: 5-24-2023
implemented bomb fruits,  
implemented slicing methods that differentiates between bombs and fruits  

### date: 5-25-2023
implemented slicedfruit subclass where sliced fruits are non interactable,  
added continuous spawning of the fruits,  
finetuned slicing for the fruits but still need to work on properly displaying sliced fruits  

### date: 5-26-2023
started implementing a displayScore method,  
started implementing end game screen  

### date: 5-29-23
finished implementing end game screen,  
"back" button resets stats from previous run,  
starting implementing slicing with images  

### date: 5-30-23
deleted SlicedFruit class and made "sliced" a field  
improved slicing by making it less sensitive  

### date: 5-31-23
added progressive difficulty in fruit spawning,  
simplified draw() by putting code into functions,  
hopefully fixed slicing finally,  
started to add more comments to the code

### date: 6-1-23
finished adding comments to improve clarity of code

### date: 6-5-23
finished adding cursor slicing effect when dragging mouse

### date: 6-6-23
fixed mouse cursor trail,  
implemented high score and retry count feature(the game displays them)

### date: 6-7-23
changed color, size, text for high score,  
added zen mode(a timer is used to end the game),  
added two spinning fruits in start menu that can be sliced to choose mode

### date: 6-8-23
implemented spawning rate for power ups in zen mode

### date: 6-9-23
fixed bug with being able to slice in paused state,  
added cheats for instantly adding powerups upon clicking 1 or 2

### date: 6-11-23
fixed bug with the highscore/retries not being displayed after multiple runs,  
added highscore/retries variables for each separate mode,  
the highscore/retries are now stored separately for each mode

## GROUP MEMBER 2: Kevin Zhou

### date: 5-22-23
implemented most of Button and FruitNinja class    
initialized start menu with clickable buttons  

### date: 5-23-23
added constructor to button that can accept PImages  
starting work on fruit physics  

### date: 5-24-23
added constructor to Fruit that can accept PImages   
adjusted size of png images to scale  
adjusted gravitational constant to simulate speed of fruit in the actual game  

### date: 5-25-23
wrote the lives class and implemented them as a feature  
started work on the slicing method  

### date: 5-26-2023 - 5-29-2023
added all the png images for sliced fruit after editing using gimp  

### date: 5-30-2023
cleaned up the sprites by resizing (gimp field day xd)  

### date: 5-31-2023
implemented combos, but was forced to revert to old implementation of slicing because of broken functionality

### date: 06-5-2023
implemented most of stains (cropped the sprite, wrote the class, figured out fading).  
tomorrow in class need to remember to disable the manual button and change the color.  

### date: 06-6-2023
finished stains by figuring out how to work around the coloring issue (combination of gimp and tint()).  

### date: 06-08-2023
used gimp to crop both powerup sprites and powerup halves, then wrote the class and added in functionality for each individual power up. next step is to incorporate them with the spawn method.  

### date: 06-09-2023
fixed combos, transitioning screens, start menu, and bug with buttons  

### date: 06-10-2023
updated the prototype document, uploaded it to the main  

## Dev Log:
### Working Features:
- Implementation of gravity that pulls fruits downwards after they are initially launched
- The fruits/powerups/bombs will be continuously spinning in a 2D manner
- Implementation of "lives" in Arcade Mode: every time a fruit is dropped, you lose a life; lose 3 lives and it's game over
- Progressive difficulty: the fruits will spawn faster and faster as time passes
- Slicing detection: the fruits/powerups/bombs can be sliced and produce their respective effects; fruit/powerup halves maintains velocity and spin after being sliced
- Scores: during a run, the current score will be displayed; after more than 1 run in a mode, the high score and number of retries on that mode will also be displayed
- Buttons: the pause button, upon being pressed, will pause the current run; the back button will bring the user back to the start menu
- Start menu: there are two spinning fruits; slice the fruit you want to determine the mode that you want to play on
- Cursor trail to emulate a "blade" for the slicing
- Stains will be produced at the location the fruit is sliced in; the stain will eventually fade away
- Combo multipliers will be produced when multiple fruits are sliced at the same time

### Broken Features/Bugs
- None that we can see so far

### Content Resources
- The Processing Documentation
