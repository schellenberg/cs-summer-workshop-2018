#----------------------------------
#Name Redacted
#Comp sci 20
#Mr.Schellenberg
#Turtles/Loops Project
#----------------------------------
import time
import turtle
import easygui_qt as easy
import random
#importing all necessary modules

size = 1 
def draw_can_into_color(some_turtle):#This function draws the red section of my cola can
    """Draws a red third of the cola can"""
    some_turtle.left(90)
    some_turtle.begin_fill()
    some_turtle.forward(400/3)
    some_turtle.color("white")
    some_turtle.left(90)
    some_turtle.forward(300)
    some_turtle.left(90)
    some_turtle.color("silver")
    some_turtle.forward(400/3)
    some_turtle.left(90)
    some_turtle.forward(300)
    some_turtle.fillcolor("red")
    some_turtle.end_fill()
    some_turtle.color("silver")
    some_turtle.left(90)

def draw_cap(some_turtle): #This draws the littl cap on the can
    """Draws the can cap on the cola can"""
    some_turtle.color("darkgrey")
    some_turtle.pensize(8)
    some_turtle.right(90)
    some_turtle.forward(20)
    some_turtle.left(90)
    some_turtle.forward(40)
    some_turtle.backward(40)
    some_turtle.right(90)
    some_turtle.forward(20)
    some_turtle.left(90)
    some_turtle.forward(40)
    some_turtle.left(90)
    some_turtle.forward(40)
    some_turtle.right(90)
    some_turtle.pensize(4)
    some_turtle.color("silver")
    
def draw_circle_for_letter(some_turtle): #A circle is used a few times for letters on my can
    """Draws a circle for letters on the cola can"""
    for int in range(90):
        some_turtle.forward(1.4)
        some_turtle.left(4)
        if int < 30 and int > -1:
            some_turtle.color("red")
        elif int < 60 and int > 30:
            some_turtle.color("crimson")#a little color variety
        else:
            some_turtle.color("red")
def draw_seeds(amount_of_seeds, some_turtle):
    """Draws a specific number of watermelon seeds evenly spaced apart"""
    for int in range(amount_of_seeds):
        some_turtle.pendown()
        some_turtle.forward(1)
        some_turtle.penup()
        some_turtle.forward(77)
def up():
    """Turns turtle heading up then moves forward"""
    heading = ben.heading()
    if heading == 0.0:
        ben.left(90)
    elif heading == 180.0:
        ben.right(90)
    elif heading == 270.0:
        ben.left(180)
    else:
        ben.forward(10)
            
def down():
    """Turns turtle heading to down then moves forward"""
    heading = ben.heading()
    if heading == 0.0:
        ben.right(90)
    elif heading == 90.0:
        ben.right(180.0)
    elif heading == 180.0:
        ben.left(90)
    else:
        ben.forward(10)

def left():
    """Turns turtle heading to the left then moves forward"""
    heading = ben.heading()
    if heading == 0.0:
        ben.left(180)
    elif heading == 90.0:
        ben.left(90)
    elif heading == 270.0:
        ben.right(90)
    else:
        ben.forward(10)
            
def right():
    """Turns turtle heading to the right then moves forward"""
    heading = ben.heading()
    if heading == 90.0:
        ben.right(90)
    elif heading == 180.0:
        ben.left(180)
    elif heading == 270.0:
        ben.left(90)
    else:
        ben.forward(10)
def color():
    """Turns turtle color to a random color"""
    color_list =["red", "orange", "yellow", "green", "lime", "cyan", "lightblue", "blue", "indigo", "violet", "pink", "black"]
    select_color = color_list[random.randrange(0, 12)]
    ben.color(select_color)
def grow():
    """Turns turtle pen size 1 larger"""
    global size
    size = size + 1
    ben.pensize(size)
def shrink():
    """Turns turtle pen size 1 smaller"""
    global size
    if size > 0:
        size = size - 1
    ben.pensize(size)
def clear():
    """Clears the screen"""
    canvas.resetscreen()
    ben.speed(0)
    size = 1
          
choice = easy.get_choice("Choose your scenario for the painting.", "Turtles", ["Cola drawing", "Melon drawing", "Free drawing"])#Get's user choice on drawing
if choice == "Cola drawing":
    #creating a turtle & properties
    canvas = turtle.Screen()
    ben = turtle.Turtle()   
    ben.color("silver")
    canvas.bgcolor("black")
    ben.speed(0)  
    ben.penup()
    ben.pensize(4)

    ben.goto(150, -200)

    ben.pendown()
    draw_can_into_color(ben)#This is my function from before

    ben.forward(400) # puts my turtle into position to draw the cap
    ben.left(90)
    ben.forward(130)

    draw_cap(ben) 

    ben.forward(130)

    draw_can_into_color(ben)

    ben.forward((400/3) * 2)#This colors in the white section of the can
    ben.left(90)
    ben.begin_fill()
    ben.color("white")
    ben.forward(300)
    ben.left(90)
    ben.color("silver") #i'm changing colors to keep the side of can silver
    ben.forward(400/3)
    ben.color("white")
    ben.left(90)
    ben.forward(300)
    ben.color("silver")
    ben.left(90)
    ben.forward(400/3)
    ben.left(90)
    ben.fillcolor("white")
    ben.end_fill()

    ben.penup()

    ben.left(90) #puts my tutle into position for the C
    ben.forward(100)
    ben.right(90)
    ben.forward(70)
    ben.left(180)

    ben.color("magenta")
    ben.pensize(5)
    ben.pendown()
    for int in range(90): #draws the C
        ben.forward(1.2)
        ben.left(2)
        if int < 30 and int > -1:
            ben.color("red")
        elif int < 60 and int > 30:
            ben.color("crimson")
        else:
            ben.color("red")
        
    ben.penup()
    ben.forward(45)
    ben.pendown()

    draw_circle_for_letter(ben) #Draws the O

    letter_height_value = ben.ycor() #this variable is to save the letter height for future letters

    ben.penup()
    ben.forward(50)
    ben.left(90)
    ben.forward(7.3)
    #These two variables save the height  for when I use that spot again
    turtle_x_value = ben.xcor() 
    turtle_y_value = ben.ycor()
    ben.right(180)
    ben.pendown()
    for int in range(45): #draws my l bottom
        ben.forward(0.2)
        ben.left(2)
        if int < 30 and int > -1:
            ben.color("red")
        elif int < 60 and int > 30:
            ben.color("crimson")
        else:
            ben.color("red")
    ben.penup() 
    ben.goto(turtle_x_value, turtle_y_value)
    ben.pendown()
    ben.left(90)
    ben.color("red")
    ben.forward(20)
    ben.color("crimson")
    ben.forward(20)
    ben.color("red")
    ben.forward(20)
    ben.goto(turtle_x_value, turtle_y_value)
    #finishes my L

    ben.right(90)
    ben.penup()
    ben.forward(50)
    turtle_x_value = ben.xcor()
    ben.goto(turtle_x_value, letter_height_value)
    ben.pendown()
    draw_circle_for_letter(ben) #Draws the circle for my A
    ben.penup()
    for int in range(45):
        ben.forward(0.7)
        ben.left(2)
    
    ben.right(160)
    ben.pendown() #finishes my A
    ben.forward(20)

    ben.penup()
    ben.goto(0,0)
    ben.color("white")
    
elif choice == "Melon drawing":
    ben = turtle.Turtle()
    canvas = turtle.Screen()
    ben.color("forestgreen")
    canvas.bgcolor("white")
    #Makes a turtle and it's properties
    ben.speed(0)
    ben.penup()
    ben.goto(-200, 0)
    ben.right(90)
    ben.pendown()
    ben.begin_fill()
    ben.pensize(20)
    #Draws watermelon peel
    for int in range(90):
        ben.forward(7)
        int_ratio = (int % 5)
        if not int_ratio == 0:#changes color to dark green and light green
            ben.color("lime")
        elif int_ratio == 0:
            ben.color("forestgreen")
        ben.left(2)
    
    ben.left(90)
    ben.goto(200,0)
    ben.color("pink")
    ben.goto(-200, 0)
    ben.fillcolor("pink")
    ben.end_fill()
    #Colors in the melon pink
    
    ben.color("forestgreen")
    ben.pensize(21)
    ben.forward(1)
    ben.penup()
    ben.goto(200, 0)
    ben.pendown()
    ben.forward(1)
    #finishes the melon peel that got erased

    ben.penup()
    ben.forward(40)
    ben.left(90)
    ben.forward(15)
    ben.pensize(25)
    ben.right(90)
    #puts turtle into position for first row of seeds
    
    ben.color("black")
    draw_seeds(5, ben)
    #draws the seeds in the watermelon
    
    ben.goto(-200, 0)
    ben.right(180)
    ben.forward(85)
    ben.right(90)
    ben.forward(80)
    ben.left(90)
    #puts turtle into position for 2nd row of seeds
    draw_seeds(4, ben)
    
    ben.right(90)
    ben.forward(65)
    ben.right(90)
    ben.forward(120)
    #puts turtle into position for final row
    draw_seeds(3, ben)
elif choice == "Free drawing":
    ben = turtle.Turtle()
    canvas = turtle.Screen()
    #Makes a turtle and it's properties
    ben.speed(0)
    easy.show_message("W-A-S-D, controls, Space bar selects a random color, Q grows and E shrinks, C clears the screen, Color Away :]", "Free Drawing")
    if True:
        #If the () key is pressed, does the "()" command
        turtle.onkeypress(up, "w")
        turtle.onkeypress(down, "s")
        turtle.onkeypress(right, "d")
        turtle.onkeypress(left, "a")
        turtle.onkeypress(color, "space")
        turtle.onkeypress(grow, "q")
        turtle.onkeypress(shrink, "e")
        turtle.onkeypress(clear, "c")
        turtle.listen()
        time.sleep(5)#A small pause to keep the program at a tolerable pace
