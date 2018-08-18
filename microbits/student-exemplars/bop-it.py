##---------------
##Name Redacted
##Comp Sci 20
##Micro:bit/function project
##May 2nd, 2018
##----------------

#This is a bop-it game using the micro:bit led display, A/B buttons and L and R tilts

import microbit
import time
import random
#importing necessary modules

def microbit_checkmark_image():
    """Shows a checkmark image whenever the function is called, when the play is successful"""
    checkmark = microbit.Image("00000:" \
                               "00009:" \
                               "00090:" \
                               "90900:" \
                               "09000:")
    microbit.display.show(checkmark) #Non-fruitful function that shows a checkmark 
    
def a_button():
    """Detects if the a button is pushed when user is asked to and returns True. Detects if the user does the wrong action to return False"""
    for counter in range(score_time):
        tilt = microbit.accelerometer.get_x() #finds if the microbit was tilted when it shouldn't be
        if microbit.button_a.was_pressed():
            return True # If the A button gets pressed in the loop
        elif microbit.button_b.was_pressed() or tilt < -400 or tilt > 400:
            return False# if any wrong thing is done, it will end the game
        time.sleep(0.5)
    return False

#This function is the same as the one above, except it's for the b button
def b_button():
    """Detects if the b button is pushed when user is asked to and returns True. Detects if the user does the wrong action to return False"""
    for counter in range(score_time):
        tilt = microbit.accelerometer.get_x()
        if microbit.button_b.was_pressed():
            return True
        elif microbit.button_a.was_pressed() or tilt < -400 or tilt > 400:
            return False
        time.sleep(0.5)
    return False

#This function is the same as the ones above excpet for it detects for the right tilt
def flip_right():
    """Detects if the left tilt is performed when user is asked to and returns True. Detects if the user does the wrong action to return False"""
    for counter in range(4 * score_time):
        tilt = microbit.accelerometer.get_x()
        if tilt > 500:
            return True
        elif microbit.button_a.was_pressed() or tilt < -400 or microbit.button_b.was_pressed():
            return False
        time.sleep(0.5 / 4)
    return False

#This function is the same as the ones above excpet for it detects for the left tilt
def flip_left():
    """Detects if the left tilt is performed when user is asked to and returns True. Detects if the user does the wrong action to return False"""
    for counter in range(4 * score_time):
        tilt = microbit.accelerometer.get_x()
        if tilt < -500:
            return True
        elif microbit.button_a.was_pressed() or tilt > 400 or microbit.button_b.was_pressed():
            return False
        time.sleep(0.5 / 4)
    return False  

score_time = 12 #The amount of time in half seconds for each round, which get's less and less
round_counter = 0 #The "score" every round adds 1
type_of_commands = ["A", "B", "Left", "Right"] #This list if for each of the bop-it commands

while True:# To make an infinite loop unless the user wins or loses
    
    bop_it = type_of_commands[random.randrange(4)] #Gets a random action from the list for the user to perform
    
    if bop_it == "A":
        microbit.display.show("A") #displays an A on the microbit then detects if the A button is pressed or a wrong command is done
        if a_button(): #If the button is pressed, the game continues untill 100 rounds which is the same for other commands.
           microbit_checkmark_image()
           time.sleep(1)
        else: # If the user waits too long or does wrong command, the game will end which is the same for the other commands (B, L, R)
            microbit.display.scroll("You lose!")
            print("You lose!")
            time.sleep(1)
            break
        
    elif bop_it == "B": #B button command
        microbit.display.show("B")
        if b_button():
            microbit_checkmark_image()
            time.sleep(1)
        else: #If the B button isn't done right, they lose
            microbit.display.scroll("You lose!")
            print("You lose!")
            time.sleep(1)
            break
        
    elif bop_it == "Left": #Left command
        microbit.display.show("L")
        if flip_left():
            microbit_checkmark_image()
            time.sleep(1)
        else:
            microbit.display.scroll("You lose!")
            print("You lose!")
            break    

    elif bop_it == "Right": #Right Command
        microbit.display.show("R")
        if flip_right():
            microbit_checkmark_image()
            time.sleep(1)
        else:
            microbit.display.scroll("You lose!")
            print("You lose!")
            break
        
    round_counter += 1 # If the user succesfully does the action command, the round continues and adds 1 to the counter
    print(round_counter)
    if round_counter % 10 == 0 and score_time >= 1: # every 10 rounds, the rounds get 1/2 seconds faster
        score_time -= 1
    if round_counter == 100: # If the user wins 100 rounds, they win the game 
        microbit.display.scroll("You Win!")
        print("You Win!")
        break
    
microbit.display.scroll("GAME OVER")