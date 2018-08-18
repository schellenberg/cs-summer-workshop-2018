#---------------------------------------------------------------------------------------------------
# Name Redacted
# Computer Science 20
# March 28, 2015
#
# Turtles/Loops Assignment
# Purpose: To create a pattern in colour or greyscale using a cube function with turtles and loops.
#---------------------------------------------------------------------------------------------------

import turtle
import random
import math



validInput = False

while validInput == False:
    colorScheme = input("Would you like an image in color or greyscale?")   # colour scheme selection
    if colorScheme == "greyscale":
        validInput = True
        def drawCube():   # greyscale cube function
            sideLength = 40   # specified side length of cube
            turtle.pendown()
            turtle.seth(0)
            for color in ("#D2D2D2", "#797878"):   # front and left faces
                turtle.fillcolor(color)
                turtle.begin_fill()
                turtle.seth(turtle.heading() + 30)
                turtle.forward(sideLength)
                turtle.seth(turtle.heading() + 60)
                turtle.forward(sideLength)
                turtle.seth(turtle.heading() + 120)
                turtle.forward(sideLength)
                turtle.seth(turtle.heading() + 60)
                turtle.forward(sideLength)
                turtle.seth(60)
                turtle.end_fill()
            turtle.sety(turtle.ycor() + sideLength)
            turtle.seth(30)
            for i in range (2):   # top face
                turtle.fillcolor("#ABA8A8")
                turtle.begin_fill()
                turtle.forward(sideLength)
                turtle.seth(turtle.heading() + 120)
                turtle.forward(sideLength)
                turtle.seth(turtle.heading() + 60)
                turtle.end_fill()
    elif colorScheme == "color":
        validInput = True
        def drawCube():   # colour cube function
            sideLength = 40   # specified side length of cube
            turtle.pendown()
            turtle.seth(0)
            for color in ("#F7BC81", "#A46D36"):   # front and left faces
                turtle.fillcolor(color)
                turtle.begin_fill()
                turtle.seth(turtle.heading() + 30)
                turtle.forward(sideLength)
                turtle.seth(turtle.heading() + 60)
                turtle.forward(sideLength)
                turtle.seth(turtle.heading() + 120)
                turtle.forward(sideLength)
                turtle.seth(turtle.heading() + 60)
                turtle.forward(sideLength)
                turtle.seth(60)
                turtle.end_fill()
            turtle.sety(turtle.ycor() + sideLength)
            turtle.seth(30)
            for i in range (2):   # top face
                turtle.fillcolor("#E8994B")
                turtle.begin_fill()
                turtle.forward(sideLength)
                turtle.seth(turtle.heading() + 120)
                turtle.forward(sideLength)
                turtle.seth(turtle.heading() + 60)
                turtle.end_fill()
    else:
        print("Invalid choice.")   # loop repeats until valid colour scheme chosen



# setting up window and turtle
wn = turtle.Screen()
wn.screensize(500,500)
turtle.hideturtle()
turtle.penup()
turtle.speed(0)



# calculating the horizontal distance between two equal points on adjacent cubes
sideLength = 40
cubeInterval = 2*(math.sqrt((2*sideLength)*(2*sideLength) - (2*sideLength)*(2*sideLength)*(math.cos(120))))



# drawing row 1
endRowNumber = 0
newRowNumber = 2
xChange = cubeInterval*((endRowNumber/2 + 0.5) + (newRowNumber/2 - 0.5))   # used to calculate the horizontal shift required to draw the next row in terms of the cubeInterval value calculated above
turtle.goto((turtle.xcor() + xChange), -300)   # this first y value is specified, on future rows it is calculated by adding the height of a cube (1.5*sideLenth) to the current y position of the turtle
for i in range (2):
    drawCube()
    turtle.penup()
    turtle.goto((turtle.xcor() - cubeInterval), (turtle.ycor() - sideLength))
endRowNumber = newRowNumber   # number of cubes in the row just drawn
newRowNumber = 5   # number of cubes in the row about to be drawn



# drawing row 2
xChange = cubeInterval*((endRowNumber/2 + 0.5) + (newRowNumber/2 - 0.5))
turtle.goto((turtle.xcor() + xChange), (sideLength*1.5 + turtle.ycor()))
for i in range (5):
    drawCube()
    turtle.penup()
    turtle.goto((turtle.xcor() - cubeInterval), (turtle.ycor() - sideLength))
endRowNumber = newRowNumber
newRowNumber = 8



# drawing rows 3 to 8
for i in range (3):
    # draws a row 8 cubes wide
    xChange = cubeInterval*((endRowNumber/2 + 0.5) + (newRowNumber/2 - 0.5))
    turtle.goto((turtle.xcor() + xChange), (sideLength*1.5 + turtle.ycor()))
    for i in range (8):
        drawCube()
        turtle.penup()
        turtle.goto((turtle.xcor() - cubeInterval), (turtle.ycor() - sideLength))
    endRowNumber = newRowNumber
    newRowNumber = 7

    # draws a row 7 cubes wide
    xChange = cubeInterval*((endRowNumber/2 + 0.5) + (newRowNumber/2 - 0.5))
    turtle.goto((turtle.xcor() + xChange), (sideLength*1.5 + turtle.ycor()))
    for i in range (7):
        drawCube()
        turtle.penup()
        turtle.goto((turtle.xcor() - cubeInterval), (turtle.ycor() - sideLength))
    endRowNumber = newRowNumber
    newRowNumber = 8



# drawing row 9
endRowNumber = 7
newRowNumber = 4
xChange = cubeInterval*((endRowNumber/2 + 0.5) + (newRowNumber/2 - 0.5))
turtle.goto((turtle.xcor() + xChange), (sideLength*1.5 + turtle.ycor()))
for i in range (4):
    drawCube()
    turtle.penup()
    turtle.goto((turtle.xcor() - cubeInterval), (turtle.ycor() - sideLength))
endRowNumber = newRowNumber
newRowNumber = 1



# drawing row 10
xChange = cubeInterval*((endRowNumber/2 + 0.5) + (newRowNumber/2 - 0.5))
turtle.goto((turtle.xcor() + xChange), (sideLength*1.5 + turtle.ycor()))
for i in range (1):
    drawCube()
    turtle.penup()
    turtle.goto((turtle.xcor() - cubeInterval), (turtle.ycor() - sideLength))



wn.exitonclick()
