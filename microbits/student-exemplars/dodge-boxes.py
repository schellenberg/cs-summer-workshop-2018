#Name Redacted
#Functions and Decisions/Selections Assignment (Microbit assignment)
#4/18/2018
#Makes an array of boxes fall from the top of the screen and you use the microbit buttons to avoid them

import microbit
import random
import time
    
def did_die(bottom, position):
    """A Fruitful Function to check if the player has died"""
    return (bottom[position] == 6)

def randomize_list(list):
    """A Fruitful Function to randomize the list of blocks that fall"""
    random.shuffle(list)
    return list

def die(score):
    """A Non-Fruitful Function handle death"""
    microbit.display.clear()
    time.sleep(0.75)
    microbit.display.scroll(str(score))
    
def display_boxes_and_players(top, middle_top, middle_bottom, bottom, position):
    """A Non-Fruitful Function that handles the graphics on the microbit by taking the boxes positions and converting it to a string"""
    image = ""
    for index in range(5):
        image = image + str(top[index])
    
    image = image + ":"
    for index in range(5):
        image = image + str(middle_top[index])
        
    image = image + ":"
    for index in range(5):
        image = image + str(middle_bottom[index])
        
    image = image + ":"
    for index in range(5):
        image = image + str(bottom[index])
    
    image = image + ":"
    for index in range(5):
        if (index == position):
            image = image + "9"
        else:
            image = image + "0"
    
    microbit.display.show(microbit.Image(image))

#Sets up the lists for the lines of boxes
top = [0] * 5
middle_top = [0] * 5
middle_bottom = [0] * 5 
bottom = [0] * 5
position = 2 #Ranges from 0 (far left) to 4 (far right)
speed = 0.5 #The speed that the blocks fall
score = 0
timer = 0.0
is_dead = False

#Continue the game until the player dies
while not is_dead:
    #Gets the start time so you can calculate the time that has passed later in the function
    start = time.time()
    
    #Displays all the boxes
    display_boxes_and_players(top, middle_top, middle_bottom, bottom, position)
    
    #Moves the player
    if (microbit.button_a.was_pressed()):
        position = position - 1
    if (microbit.button_b.was_pressed()):
        position = position + 1
    
    #Clamps the players position
    if (position < 0):
        position = 0
    if (position > 4):
        position = 4
    
    #The the time is greater then the speed move the rows of blocks
    if (timer > speed):
        index = 0
        
        #Checks if dead
        is_dead = did_die(bottom, position)
       
        #Shifts all the rows down
        #Had to use the specific index because saying LIST = LIST caused numerous errors       
        while index < 5:
            bottom[index] = middle_bottom[index]
            middle_bottom[index] = middle_top[index]
            middle_top[index] = top[index]
            index = index + 1
        
        #Randomizes the top row
        value = random.randrange(0, 100)
        if (value < 10):
            list = [6,6,0,0,0]
        elif (value < 60):
            list = [6,0,0,0,0]
        else:
            list = [0,0,0,0,0]
        
        top = randomize_list(list)
        
        #Changes the speed and the score
        timer = 0
        speed = speed - (speed * 0.02)
        score = score + 1
        if (speed < 0.1):
            speed = 0.1
    
    #Calculates the time that has passed
    end = time.time()
    timer = timer + (end - start)

#When you lose, instigate the dead sequence
die(score)

