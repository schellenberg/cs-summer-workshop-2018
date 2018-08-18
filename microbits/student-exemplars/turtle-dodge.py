########################################
#Name Redacted
#Computer Science 20
#May 1 2018
#Mr. Schellenberg
#Purpose: to use functions and the microbit
#How to play: Try to catch the falling turtle
#########################################

import microbit
import time 
import turtle
import random

def is_in_screen(the_window, the_turtle): 
    
    """Makes a function where the turtle cannot pass out of the screen by returning true or false"""
    
    if the_turtle.xcor() > the_window.window_width()/2:
        return False
    elif the_turtle.xcor() < the_window.window_width()/-2:
        return False
    elif the_turtle.ycor() > the_window.window_height()/2:
        return False
    elif the_turtle.ycor() < the_window.window_height()/-2:
        return False
    else:
        return True
    
    
def turtles_are_touching(main_turtle, dropping_turtle, distance_range):
    """determines the distance between two turtles and returns true or false based on if the proximity is greater than the range"""

    x_dist = main_turtle.xcor() - dropping_turtle.xcor()
    y_dist = main_turtle.ycor() - dropping_turtle.ycor()

    proximity = ( y_dist**2 + x_dist**2) ** 0.5

    if proximity > distance_range:
        return False
    else:
        return True    

    
    
 
def falling_turtle_moving(falling_turtle):
    """Puts turtle into the right positon and makes it fall"""
    
    if falling_turtle.ycor() >= 300:
        falling_turtle.right(180)
        falling_turtle.goto(random.randrange(-200, 200), 300)
        falling_turtle.forward(20)
    elif falling_turtle.ycor() <= -300:
        falling_turtle.right(180)
        falling_turtle.goto(random.randrange(-200, 200), -300)
        falling_turtle.forward(20)
    
    

score = 0

#constant

POINTS_TO_WIN = 10

# list
shaz_color = ["green", "red", "blue"]

#Creating turtles

final_time = 0

canvas = turtle.Screen()
shaz = turtle.Turtle()

shaz.shape("turtle")
shaz.color(random.choice(shaz_color))

microbit.display.show(microbit.Image.MEH)
shaz.penup()
shaz.speed(0)

shot = turtle.Turtle()
shot.penup()
shot.speed(0)


#SETTING UP SPIKE TURTLES IN THEIR RANDOM POSITIONS


shot.goto(random.randrange(-200, 200), -300)
shot.showturtle()
shot.left(90)


#game loop

while True:
    x = microbit.accelerometer.get_x()
    
    start_time = time.time()
    
    
    shaz.speed(0)
    
    #moves falling turtle
    
    shot.forward(20)

    
    #FALLING TURTLE TURNING AROUND
    
    for counter in range(6):
        falling_turtle_moving(shot)
            
            #MOVING MICROBIT

    if x > 50 and is_in_screen(canvas, shaz):
        shaz.forward(15)
            
    elif x < -50 and is_in_screen(canvas, shaz): 
        shaz.backward(15)
        
    elif not is_in_screen(canvas, shaz):
        shaz.goto(0,0)
    
    #COLLISON

    if turtles_are_touching(shot, shaz, 20):
        microbit.display.show(microbit.Image.HAPPY)
        shot.speed(0)
 
        time.sleep(.5)
        
        score = score + 1
  
        time.sleep(.5)
 
        print("You got a point!")
        
    else:
        microbit.display.show(microbit.Image.MEH)
        
        
    #TIMES UP
        
    new_time = time.time()
    fianl_time = new_time - start_time

       #Game ends
        
    if score == 10:
        print("You win! You have reached 10 points!")
        microbit.display.show(microbit.Image.HAPPY)
        break
        
    elif score < 10 and final_time == 45:
        print("You ran out of time! Your final score is " , score)
        microbit.display.show(microbit.Image.SAD)
        break
        
        
        

        
       
       
       

        
    




        
