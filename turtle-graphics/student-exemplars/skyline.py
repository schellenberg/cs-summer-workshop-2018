#######################################################
# Name Redacted
# Computer Science 20
# April 11, 2018
# 
# Turtle Drawing
# Purpose: Demonstarte knowledge of turtle, if/elif/else blocks, adn while/for loops
#######################################################
#import programs that i will need during the code
import easygui_qt as easy
import turtle
import random

#give user the choices between two different drawings, then asking for their choice
list_of_drawings = ["City Skyline", "Star"]
my_choice = easy.get_choice("Which drawing would you like to see?", "Drawings", list_of_drawings)

#code if they choose City Skyline
if my_choice == "City Skyline":
    
#Setting easier name for sreen and choosing its color
    wn = turtle.Screen()
    wn.bgcolor("royalblue")
    
    #setting name of turtle
    drake = turtle.Turtle()
    
#give turtle instructions (color, position, size) aswell when to start drawing
    drake.penup()
    drake.speed(0)
    drake.goto(-330.00,-180.00)
    drake.color("purple","skyblue")
    drake.pensize(5)
    drake.begin_fill()
    drake.pendown()
  
  #giving turtle instruction on first layer of buildings
    for i in [0,1,2,3,4,5]:
        drake.left(90)
        drake.forward(250)
        drake.right(45)
        drake.forward(20)
        drake.right(45)
        drake.forward(15)
        drake.left(45)
        drake.forward(10)
        drake.right(45)
        drake.forward(10)
        drake.left(85)
        drake.forward(40)
        drake.right(170)
        drake.forward(40)
        drake.left(85)    
        drake.forward(10)
        drake.right(45)
        drake.forward(10)
        drake.left(45)
        drake.forward(15)
        drake.right(45)
        drake.forward(20)
        drake.right(45)
        drake.forward(250)
        drake.left(90)
        drake.forward(10)
    
    #Giving turtle signal o stop its coloring
    drake.end_fill()
    
    
    #giving turtle instruction on second layer of buildings
    drake.penup()
    drake.speed(0)
    drake.goto(-350.00,-215.00)
    drake.color("green","yellow")
    drake.pensize(5)
    drake.begin_fill()
    drake.pendown()
    
    #start drawng buildings
    for i in [0,1,2,3,4,5,6,7,8,9]:
        drake.left(90)
        drake.forward(210)
        drake.right(45)
        drake.forward(20)
        drake.right(45)
        drake.forward(25)
        drake.right(45)
        drake.forward(20)
        drake.right(45)
        drake.forward(210)
        drake.left(90)
        drake.forward(15)
        
    #giving turtle instruction to finish coloring    
    drake.end_fill()
    
    #giving turtle instruction on second layer of buildings
    drake.penup()
    drake.speed(0)
    drake.goto(-350.00,-190.00)
    drake.color("black","white")
    drake.pensize(5)
    drake.begin_fill()
    drake.pendown()
    
#start drawng buildings
    drake.forward(20)
    drake.left(90)
    drake.forward(60)
    drake.right(45)
    drake.forward(10)
    drake.left(45)
    drake.forward(100)
    drake.right(45)
    drake.forward(30)
    drake.left(45)
    drake.forward(125)
    drake.right(45)
    drake.forward(20)
    drake.right(135)
    drake.forward(260)
    for i in [0,1,2]:
        drake.left(90)
        drake.forward(15)
        drake.left(90)
        drake.forward(65)
        drake.right(90)
        drake.forward(42)
        drake.right(90)
        drake.forward(90)
    drake.left(90)
    drake.forward(15)
    drake.left(90)
    drake.forward(250)
    drake.right(90)
    drake.forward(30)
    drake.right(90)
    drake.forward(250)
    drake.left(90)
    drake.forward(15)
    drake.left(85)
    drake.forward(310)
    drake.left(95)
    drake.forward(20)
    drake.right(90)
    drake.forward(5)
    drake.right(90)
    drake.forward(5)
    drake.left(120)
    drake.forward(8)
    drake.right(30)
    drake.forward(8)
    drake.right(90)
    drake.forward(10)
    drake.left(65)
    drake.forward(8)
    drake.left(25)
    drake.forward(10)
    drake.right(90)
    drake.forward(10)
    drake.left(90)
    drake.forward(8)
    drake.right(90)
    drake.forward(5)
    drake.left(90)
    drake.forward(45)
    drake.left(90)
    drake.forward(5)
    drake.right(90)
    drake.forward(5)
    drake.right(90)
    drake.forward(5)
    drake.left(90)
    drake.forward(65)
    drake.right(90)
    drake.forward(2)
    drake.right(90)
    drake.forward(65)
    drake.left(90)
    drake.forward(5)
    drake.right(90)
    drake.forward(5)
    drake.right(90)
    drake.forward(5)
    drake.left(90)
    drake.forward(45)
    drake.left(90)
    drake.forward(5)
    drake.right(90)
    drake.forward(8)
    drake.left(90)
    drake.forward(10)
    drake.right(90)
    drake.forward(10)
    drake.left(25)
    drake.forward(8)
    drake.left(65)
    drake.forward(10)
    drake.right(90)
    drake.forward(8)
    drake.right(30)
    drake.forward(8)
    drake.left(120)
    drake.forward(5)
    drake.right(90)
    drake.forward(5)
    drake.right(90)
    drake.forward(20)
    drake.left(95)
    drake.forward(310)
    drake.left(85)
    drake.forward(19)    
    drake.forward(15)
    drake.left(90)
    drake.forward(250)
    drake.right(90)
    drake.forward(30)
    drake.right(90)
    drake.forward(250)
    drake.left(90)
    drake.forward(15)
    for i in [0,1,2]: 
        drake.left(90)
        drake.forward(145)
        drake.right(45)
        drake.forward(20)
        drake.right(45)
        drake.forward(25)
        drake.right(45)
        drake.forward(20)
        drake.right(45)
        drake.forward(75)
        drake.left(90)
        drake.forward(15)  
    drake.goto(302.08,-205.00)
    drake.goto(-350.00,-205.00)
    drake.goto(-350.00,-190.00)
    
    #giving turtle instruction to finish coloring
    drake.end_fill()

    #giving turtle instruction on second layer of buildings
    drake.penup()
    drake.speed(0)
    drake.goto(-320.00,-225.00)
    drake.pendown()
    drake.color("grey","red")
    drake.pensize(5)
    drake.begin_fill()
    
    #start drawng buildings
    for i in [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]:
        drake.left(90)
        drake.forward(180)
        drake.right(90)
        drake.forward(30)
        drake.right(90)
        drake.forward(180)
        drake.left(90)
        drake.forward(10)
        
    #giving turtle instruction to finish coloring
    drake.end_fill()
    
    #giving turtle instruction to start nex layer of buildings
    drake.penup()
    drake.speed(0)
    drake.goto(-350.00,-225.00)
    drake.pendown()
    drake.color("black","orange")
    drake.pensize(5)
    drake.begin_fill()
    
    #start drawing buildings
    for i in [0,1,2,3,4,5,6,7,8,9,10,11]:
        drake.left(90)
        drake.forward(50)
        drake.right(90)
        drake.forward(50)
        drake.right(90)
        drake.forward(50)
        drake.left(90)
        drake.forward(10)
        
    #giving turtle instruction to finish coloring    
    drake.end_fill()
    
    #if user chooses they can exit by clicking screen
    wn.exitonclick()
    
    # if user chooses star, this is the code it will run
elif my_choice == "Star":
    
    #color of the different pens ill use
    colors  = ["red","green","blue","orange","purple","pink","yellow","light blue","black","hot pink","violet","royal blue","grey","brown"]

    #select an easier name for screen as well as the background color
    wn = turtle.Screen()
    wn.bgcolor("white")
    
    #Change name of turtle as well as setting its instructinos, color, size, speed width
    ringo = turtle.Turtle()
    ringo.width(10) 
    length = 5
    ringo.speed(10)
    
##    instructions for the turtle to draw, which will be a loop that will repeat 
    for count in range(130):
        
        #chose random color everytime a line is drawn
        color = random.choice(colors)
        
        #instructions for turtle to draw
        ringo.forward(length)
        ringo.right(135)
        ringo.color(color)
        length = length + 5
        
        #if user chooses they can exit by clicking screen
        wn.exitonclick()
    
