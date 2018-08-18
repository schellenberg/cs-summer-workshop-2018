#######################################################
# Name Redacted
# Computer Science 20
# May 2, 2018
# 
# Microbit Treasure Finder Program
# Purpose: To play a game where you use a microbit that controls a turtle to find hindden treasures.
#######################################################

# Importing necessary modules.
import microbit
import time
import turtle
import math
import numpy as np
import easygui_qt as easy
from random import randint

def treasure_condition(locations):
    """Returns if all the treasure have been found."""
    return not len(locations) == 0

def loop_for_treasure_locations_array(locations):
    """A recursive function that is used in the function defined after this one that removes any treasures that have been found."""
    for index in range(len(locations)):
        if turt.distance(locations[index][0], locations[index][1]) <= 20:
            locations.remove(locations[index])
            locations = loop_for_treasure_locations_array(locations)
            break
    return locations

def check_for_treasure(locations):
    """A function that checks if a treasure is under the turtle and tells the player if he found treasure via microbit. The treasure is a circle with a radius of 20, centered at the treasure location coords that are made later. Returns the modified treasure locations at the end."""
    prior_treasure_amount = len(locations)
    for index in range(len(locations)):
        # The 20 is the maximum distance the turtle can be to the treasure location to be allowed be considered found.
        if turt.distance(locations[index][0], locations[index][1]) <= 20:
            # Since the length of array changes when you remove a element, to not let the index exceed the array length I made a recursive function that keeps on going until all found treasures are removed.
            # After the recursive function ends, the for loop breaks. Most of the time only one treasure is found but there is a extremely small chance that a treasure might overlap.
            locations.remove(locations[index])
            locations = loop_for_treasure_locations_array(locations)
            break        
    # The microbit shows a X if nothing is found and if some number of treasure is found, a message is shown in the microbit explaining what how much treasure is found.
    current_treasure_amount = len(locations)
    if prior_treasure_amount - current_treasure_amount == 0:
        microbit.display.show("X")
        time.sleep(0.5)
        microbit.display.clear()
    else:
        microbit.display.scroll("You found " + str(prior_treasure_amount - current_treasure_amount) + " treasure(s)!")
    return locations

def set_brightness(distance):
    """Returns a brightness value, depending on the distance the turtle is from the treasure."""
    if math.floor(distance / 100) - 1 >= 0 and math.floor(distance / 100) - 1 <= 9:
        return 9 - (math.floor(distance / 100) - 1)
    elif math.floor(distance / 100) - 1 >= 0:
        return 1
    else:
        return 9

def treasure_hunter(locations):
    """Shows the location of the treasures, relative to your turtle, on your microbit. The middle led of the microbit is your turtle."""
    angle_to_treasure = []
    treasure_distance = []
    image_of_treasure = ""
    microbit_treasure_image = np.matrix([[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]])
    
    # Sets up array of angles based on the turtle and treasure locations.
    for index in range(len(locations)):
        if math.degrees(math.atan2((locations[index][1] - turt.ycor()), (locations[index][0] - turt.xcor()))) < 0:
            angle = 360 + math.degrees(math.atan2((locations[index][1] - turt.ycor()), (locations[index][0] - turt.xcor())))
        else:
            angle = math.degrees(math.atan2((locations[index][1] - turt.ycor()), (locations[index][0] - turt.xcor())))
        angle_to_treasure.append(angle)
        
    # Sets up array of distances based on the turtle and treasure locations..
    for index in range(len(locations)):
        treasure_distance.append(turt.distance(locations[index][0], locations[index][1]))
        
    # Sets up a matrix that is supposed to match the one on the microbit led screen that's going to show how close the turtle is from the treasure.
    # Used the name theta because I couldn't find a better name for that variable.
    for index in range(len(treasure_distance)):
        brightness = set_brightness(treasure_distance[index])
        
        # The outer box of leds in the microbit.
        if treasure_distance[index] >= 200:
            number_of_rotation = 4 - math.floor(angle_to_treasure[index] / 90)
            microbit_treasure_image = np.rot90(microbit_treasure_image, number_of_rotation)
            theta = angle_to_treasure[index] - 90 * (4 - number_of_rotation)
            if theta < math.degrees(math.atan(0.25)):
                if microbit_treasure_image[2, 4] < brightness:
                    microbit_treasure_image[2, 4] = brightness
            elif theta < math.degrees(math.atan(0.75)):
                if microbit_treasure_image[1, 4] < brightness:
                    microbit_treasure_image[1, 4] = brightness
            elif theta < 90 - math.degrees(math.atan(0.75)):
                if microbit_treasure_image[0, 4] < brightness:
                    microbit_treasure_image[0, 4] = brightness
            elif theta < 90 - math.degrees(math.atan(0.25)):
                if microbit_treasure_image[0, 3] < brightness:
                    microbit_treasure_image[0, 3] = brightness
            else:
                if microbit_treasure_image[0, 2] < brightness:
                    microbit_treasure_image[0, 2] = brightness
            microbit_treasure_image = np.rot90(microbit_treasure_image, 4 - number_of_rotation)
            
        # The next inner box of leds in the microbit.
        elif treasure_distance[index] > 20:
            number_of_rotation = 4 - math.floor(angle_to_treasure[index] / 90)
            microbit_treasure_image = np.rot90(microbit_treasure_image, number_of_rotation)
            theta = angle_to_treasure[index] - 90 * (4 - number_of_rotation)
            if theta < math.degrees(math.atan(0.5)):
                if microbit_treasure_image[2, 3] < brightness:
                    microbit_treasure_image[2, 3] = brightness
            elif theta < 90 - math.degrees(math.atan(0.5)):
                if microbit_treasure_image[1, 3] < brightness:
                    microbit_treasure_image[1, 3] = brightness
            else:
                if microbit_treasure_image[1, 2] < brightness:
                    microbit_treasure_image[1, 2] = brightness
            microbit_treasure_image = np.rot90(microbit_treasure_image, 4 - number_of_rotation)
        
        # Middle led in the microbit.
        else:
            if microbit_treasure_image[2, 2] < brightness:
                microbit_treasure_image[2, 2] = brightness

    # Takes the elements in a matrix row and concatenate them so I can concatenate all the rows into proper microbit image display format.
    for index_1 in range(microbit_treasure_image.shape[0]):
        image_of_row  = ""
        for index_2 in range(microbit_treasure_image.shape[1]):
            image_of_row = image_of_row + str(microbit_treasure_image[index_1, index_2])
        image_of_treasure = image_of_treasure + image_of_row + ":"
    treasure_image = microbit.Image(image_of_treasure.rstrip(":"))
    microbit.display.show(treasure_image)
    time.sleep(1)
    microbit.display.clear()

# Control explanation for the player.
easy.show_message("Tilt microbit right to turn the turtle clockwise and left for counter-cloockwise. Tilt forwards to move the turtle. Press the a button to search for a treasure under the turtle or the b button to use the compass to hunt for the treasure.", "Instructions")

# Sets up the screen and turtle.
wn = turtle.Screen()
wn.setworldcoordinates(-1000, -1000, 1000, 1000)
wn.bgcolor("white")
turt = turtle.Turtle()
turt.up()
turt.home()

# Creates a random amount of treasure locations and puts them in a array. The minimum amount is 3 and maximum amount is 7.
# For all coord_treasure_locations[index][0], that is the x value while coord_treasure_locations[index][1] is the y value.
coord_treasure_locations = []
for amount_treasure in range(randint(3, 7)):
    coord_treasure_locations.append([randint(-1000, 1000), randint(-1000, 1000)])
    
# Sets up a start time of the game and tells players on the microbit of how many treasures are in the map.
start_time = time.time()
microbit.display.scroll("There are " + str(len(coord_treasure_locations)) + " treasures!")

# This while statement runs until all the treasures are found. Also sets up microbit movements that control the turtle.
# Closes the turtle screen when all treasures are found and tells the player how long the player has taken to find all the treasures, on the microbit.
while treasure_condition(coord_treasure_locations):
    x = microbit.accelerometer.get_x()
    y = microbit.accelerometer.get_y()
    if x > 500:
        turt.rt(10)
    if x < -500:
        turt.lt(10)
        
    # Two different speed of the turtle amount.
    if y < -700:
        turt.fd(20)
    elif y < -500:
        turt.fd(10)
    if microbit.button_a.was_pressed():
        coord_treasure_locations = check_for_treasure(coord_treasure_locations)
    if microbit.button_b.was_pressed():
        treasure_hunter(coord_treasure_locations)
    time.sleep(0.1)

wn.bye()
end_time = time.time()
microbit.display.scroll("It took you " + str(round((end_time - start_time), 1)) + " seconds.")