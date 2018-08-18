##############################################################################
# Name Redacted
# Computer Science 20
# May 2, 2018
# 
# Fruitful Functions and Microbit Assignment
# Purpose: To use fruitful and other function with a microbit to create a game
##############################################################################

#importing modules
import microbit
import turtle
import random
import time
import easygui_qt as easy

#setting up turtle screen and turtles
wn = turtle.Screen()
microbit.display.clear()
alba = turtle.Turtle()
alba.shape("turtle")
alba.color("black")
dots = turtle.Turtle()
dots.pensize(8)
dots.penup()
dots.hideturtle()

#creating microbit function
def tilt_direction(sensitivity_amount):
    """figure out the tilt of the mircrobit"""
    # if tilted more on one axis, use that axis to determine the 'direction' of the tilt
    
    x_tilt = microbit.accelerometer.get_x()
    y_tilt = microbit.accelerometer.get_y()

    if abs(x_tilt) > abs(y_tilt):
        # use x axis
        if x_tilt > sensitivity_amount:
            return "right"

        elif x_tilt < -1 * sensitivity_amount:
            return "left"

    else:
        # use y axis
        if y_tilt > sensitivity_amount:
            return "down"

        elif y_tilt < -1 * sensitivity_amount:
            return "up"

#creating turtle movement functions
def move_right(a_turtle):
    """To move the turtle right when needed"""
    microbit.display.show("R")
    while not a_turtle.heading() == 0:
        a_turtle.left(90)
    a_turtle.forward(10)
    time.sleep(0.01)
    
def move_left(a_turtle):
    """To move the turtle left when needed"""
    microbit.display.show("L")
    while not a_turtle.heading() == 180:
        a_turtle.left(90)
    a_turtle.forward(10)
    time.sleep(0.01)
    
def move_up(a_turtle):
    """To move the turtle up when needed"""
    microbit.display.show("U")
    while not a_turtle.heading() == 90:
        a_turtle.left(90)
    a_turtle.forward(10)
    time.sleep(0.01)
    
def move_down(a_turtle):
    """To move the turtle down when needed"""
    microbit.display.show("D")
    while not a_turtle.heading() == 270:
        a_turtle.left(90)
    a_turtle.forward(10)
    time.sleep(0.01)

#creating turtle proximity function
def turtles_are_touching(first_turtle, second_turtle, close_enough_distance):
    """Returns True or False, based on whether two turtles are 'close enough' to be touching."""

    x_dist = first_turtle.xcor() - second_turtle.xcor()
    y_dist = first_turtle.ycor() - second_turtle.ycor()

    distance_apart = ( x_dist**2 + y_dist**2) ** 0.5

    if distance_apart < close_enough_distance:
        return True
    else:
        return False

#my fruitful function
def dots_position(a_turtle):
    """To create dots for the user to get"""
    xcord = random.randrange(-180,180)
    ycord = random.randrange(-180,180)
    
    return(xcord, ycord)

#using fruitful function to send the turtle dots to random postion
location = dots_position(dots)
#setting up score variable for end game
score = 0

dots.goto(location)
dots.dot()

if turtles_are_touching(alba,dots,20):
    dots.hideturtle()
    dots.goto(location)
    dots.dot()


#using tilt and direction functions to move turtle
while not turtles_are_touching(alba,dots, 20):
    tilt = tilt_direction(200)
    alba.penup()
    
    if turtles_are_touching(alba,dots, 20):
        score = score + 1
    else:
        if tilt == "right":
            move_right(alba)
        elif tilt == "left":
            move_left(alba)
        elif tilt == "up":
            move_up(alba)
        elif tilt == "down":
            move_down(alba)
        else:
            microbit.display.show("-")

easy.show_message("finished")
wn.exitonclick()



