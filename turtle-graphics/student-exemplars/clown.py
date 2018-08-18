#####################################
#Turtle Drawing Assignment
#April 15 2018
#Name Redacted
#Computer Science 20
#Purpose to use turtles & loops correctly
#######################################

import turtle
import easygui_qt as easy

choices = ["Normal Colors", "Black and White", "I Pick"]

choice = easy.get_choice("Would you like the drawing in normal color, black and white, or you pick (one word only)?", "Color Options", choices)


canvas = turtle.Screen()
#canvas.tracer(10)
canvas.bgcolor("black")
penny = turtle.Turtle()
penny.speed(0)

def draw_square(some_turtle, side_length, turtle_color):
    """Draws a square using the turtle, side length, and color you choose"""
    
    some_turtle.color(turtle_color)
    some_turtle.begin_fill()
    for counter in range(4):
        some_turtle.forward(side_length)
        some_turtle.right(90)
    some_turtle.end_fill()
    
def draw_range_squares(some_turtle, side_length, some_range, turtle_color):
    """draws a number of squares depending on what you put as the range"""
    
    for counter in range(some_range):
        draw_square(penny, side_length, turtle_color)
        penny.forward(side_length)
        
def going_up(some_turtle, side_length):
    """put the turtle in the right position and spot for it to draw squares back towards the top of the balloon"""
    

    penny.right(90)
    penny.forward(side_length * 2)
    penny.right(90)

 ##Starting the Drawing   
    
if choice == "Black and White":
    penny.penup()    
    penny.goto(-260, 100)
    penny.pendown()

    # Drawing the balloon

    draw_square(penny, 20, "grey")
    penny.forward(20)
    penny.right(180)

    for counter in range(3):
        draw_square(penny, 20, "grey")
        penny.forward(20)
        
    penny.right(90)
    penny.forward(20)
    penny.right(90)
    penny.forward(50)

    for counter in range(2):
        draw_square(penny, 20, "grey")
        penny.forward(20)
    penny.left(90)

    draw_range_squares(penny, 20, 6, "grey")
    penny.forward(20)
    penny.left(180)

    draw_range_squares(penny, 20, 7, "grey" )
    going_up(penny, 20)

    draw_range_squares(penny, 20, 8, "grey")
    penny.left(180)

    draw_range_squares(penny, 20, 8, "grey")
    going_up(penny, 20)

    draw_range_squares(penny, 20, 8, "grey")
    penny.forward(-20)
    penny.left(180)

    draw_range_squares(penny, 20, 7, "grey")
    going_up(penny, 20)

    draw_range_squares(penny, 20, 6, "grey")

    penny.penup()

    #balloon over

    penny.goto(-120, 100)

    #drawing clown hair
    
    penny.pendown()

    draw_range_squares(penny, 20, 4, "darkgrey")
    penny.forward(20)
    penny.right(180)

    draw_range_squares(penny, 20, 4, "darkgrey")

    going_up(penny, 20)

    draw_range_squares(penny, 20, 5, "darkgrey")

    penny.penup()
    penny.goto(105, 127)
    penny.pendown()

    draw_range_squares(penny, 20, 5, "darkgrey")
    penny.forward(-20)
    penny.left(180)

    draw_range_squares(penny, 20, 4, "darkgrey")

    penny.penup()
    penny.forward(20)
    going_up(penny, 20)
    penny.pendown()

    draw_range_squares(penny, 20, 4, "darkgrey")
    
    #Drawing the clowns head

    penny.color("white")
    penny.begin_fill()
    penny.circle(83, 180)
    penny.forward(20 * 4)
    penny.circle(83, 180)
    penny.end_fill()
    
    #Drawing the clowns makeup
    
    penny.penup()
    penny.goto(20, 200)
    penny.pendown()
    penny.right(180)
    penny.right(90)
    penny.forward(-7)
    draw_square(penny, 7, "black")
    penny.forward(7)
    penny.left(90)
    draw_range_squares(penny, 7, 13, "black")
    
    penny.penup()
    penny.goto(-60, 200)
   
    draw_range_squares(penny, 7, 13, "black")
    
    penny.penup()
    penny.goto(-67, 207)
    draw_square(penny, 7, "black")
    
    
    penny.penup()
    penny.goto(40, 170)
    penny.right(90)
    
    #Drawing right eye
    
    draw_range_squares(penny, 3, 14, "grey")
    penny.left(90)
    for counter in range(5):
        draw_square(penny, 3, "grey")
        penny.forward(3)
        penny.left(90)
        draw_square(penny, 3, "grey")
        penny.forward(3)
        penny.right(90)
    penny.left(90)
    draw_range_squares(penny, 3, 3, "grey")
    for counter in range(5):
        draw_square(penny, 3, "grey")
        penny.forward(3)
        penny.left(90)
        draw_square(penny, 3, "grey")
        penny.forward(3)
        penny.right(90)
    
    #Drawing left eye
        
    penny.penup()
    penny.goto(-40, 170)
    penny.left(180)
    draw_range_squares(penny, 3, 14, "grey")
    penny.left(90)
    for counter in range(5):
        draw_square(penny, 3, "grey")
        penny.forward(3)
        penny.left(90)
        draw_square(penny, 3, "grey")
        penny.forward(3)
        penny.right(90)
    penny.left(90)
    draw_range_squares(penny, 3, 3, "grey")
    for counter in range(5):
        draw_square(penny, 3, "grey")
        penny.forward(3)
        penny.left(90)
        draw_square(penny, 3, "grey")
        penny.forward(3)
        penny.right(90)

    #Drawing nose
        
    penny.penup()
    penny.goto(-30, 125)
    draw_square(penny, 30, "darkgrey")
    
    
    #Drawing mouth
    
    penny.penup()
    penny.goto(-60, 90)
    penny.right(90)
    for counter in range(4):
        draw_square(penny, 8, "darkgrey")
        penny.forward(8)
        penny.left(90)
        draw_square(penny, 8, "darkgrey")
        penny.forward(8)
        penny.right(90)
    penny.left(90)
    draw_range_squares(penny, 8, 3, "darkgrey")
    for counter in range(4):
        draw_square(penny, 8, "darkgrey")
        penny.forward(8)
        penny.left(90)
        draw_square(penny, 8, "darkgrey")
        penny.forward(8)
        penny.right(90)
    
    #Drawing balloon string
        
    penny.penup()
    penny.goto(-250, 75)
    penny.right(90)
    draw_range_squares(penny, 2, 90, "white")
    
    #Final Message
    
    penny.write("Hello!", font=("Arial", 45, "normal"))
    
    #Finished

elif choice == "Normal Colors":
    penny.penup()    
    penny.goto(-260, 100)
    penny.pendown()
    
    #Drawing the balloon

    draw_square(penny, 20, "red")
    penny.forward(20)
    penny.right(180)

    for counter in range(3):
        draw_square(penny, 20, "red")
        penny.forward(20)
        
    penny.right(90)
    penny.forward(20)
    penny.right(90)
    penny.forward(50)

    for counter in range(2):
        draw_square(penny, 20, "red")
        penny.forward(20)
    penny.left(90)

    draw_range_squares(penny, 20, 6, "red")
    penny.forward(20)
    penny.left(180)

    draw_range_squares(penny, 20, 7, "red" )
    going_up(penny, 20)

    draw_range_squares(penny, 20, 8, "red")
    penny.left(180)

    draw_range_squares(penny, 20, 8, "red")
    going_up(penny, 20)

    draw_range_squares(penny, 20, 8, "red")
    penny.forward(-20)
    penny.left(180)

    draw_range_squares(penny, 20, 7, "red")
    going_up(penny, 20)

    draw_range_squares(penny, 20, 6, "red")

    penny.penup()

    #balloon over

    penny.goto(-120, 100)

    #Drawing the clowns hair
    
    penny.pendown()

    draw_range_squares(penny, 20, 4, "darkorange")
    penny.forward(20)
    penny.right(180)

    draw_range_squares(penny, 20, 4, "darkorange")

    going_up(penny, 20)

    draw_range_squares(penny, 20, 5, "darkorange")

    penny.penup()
    penny.goto(105, 127)
    penny.pendown()

    draw_range_squares(penny, 20, 5, "darkorange")
    penny.forward(-20)
    penny.left(180)

    draw_range_squares(penny, 20, 4, "darkorange")

    penny.penup()
    penny.forward(20)
    going_up(penny, 20)
    penny.pendown()

    draw_range_squares(penny, 20, 4, "darkorange")
    
    #Drawing the clownds head

    penny.color("white")
    penny.begin_fill()
    penny.circle(83, 180)
    penny.forward(20 * 4)
    penny.circle(83, 180)
    penny.end_fill()
    
    #Drawing the clowns makeup
    
    penny.penup()
    penny.goto(20, 200)
    penny.pendown()
    penny.color("red")
    penny.right(180)
    penny.right(90)
    penny.forward(-7)
    draw_square(penny, 7, "red")
    penny.forward(7)
    penny.left(90)
    draw_range_squares(penny, 7, 13, "red")
    
    penny.penup()
    penny.goto(-60, 200)
   
    draw_range_squares(penny, 7, 13, "red")
    
    penny.penup()
    penny.goto(-67, 207)
    draw_square(penny, 7, "red")
    
    
    penny.penup()
    penny.goto(40, 170)
    penny.right(90)
    
    #Drawing the right eye
    
    draw_range_squares(penny, 3, 14, "black")
    penny.left(90)
    for counter in range(5):
        draw_square(penny, 3, "black")
        penny.forward(3)
        penny.left(90)
        draw_square(penny, 3, "black")
        penny.forward(3)
        penny.right(90)
    penny.left(90)
    draw_range_squares(penny, 3, 3, "black")
    for counter in range(5):
        draw_square(penny, 3, "black")
        penny.forward(3)
        penny.left(90)
        draw_square(penny, 3, "black")
        penny.forward(3)
        penny.right(90)
    
    #Drawing the left eye
        
    penny.penup()
    penny.goto(-40, 170)
    penny.left(180)
    draw_range_squares(penny, 3, 14, "black")
    penny.left(90)
    for counter in range(5):
        draw_square(penny, 3, "black")
        penny.forward(3)
        penny.left(90)
        draw_square(penny, 3, "black")
        penny.forward(3)
        penny.right(90)
    penny.left(90)
    draw_range_squares(penny, 3, 3, "black")
    for counter in range(5):
        draw_square(penny, 3, "black")
        penny.forward(3)
        penny.left(90)
        draw_square(penny, 3, "black")
        penny.forward(3)
        penny.right(90)

    #Drawing the nose
        
    penny.penup()
    penny.goto(-30, 125)
    draw_square(penny, 30, "red")
    
    #Drawing the mouth
    
    penny.penup()
    penny.goto(-60, 90)
    penny.right(90)
    for counter in range(4):
        draw_square(penny, 8, "red")
        penny.forward(8)
        penny.left(90)
        draw_square(penny, 8, "red")
        penny.forward(8)
        penny.right(90)
    penny.left(90)
    draw_range_squares(penny, 8, 3, "red")
    for counter in range(4):
        draw_square(penny, 8, "red")
        penny.forward(8)
        penny.left(90)
        draw_square(penny, 8, "red")
        penny.forward(8)
        penny.right(90)
    
    #Drawing the balloon string
        
    penny.penup()
    penny.goto(-250, 75)
    penny.right(90)
    draw_range_squares(penny, 2, 90, "white")
    
    #Final Message
    
    penny.write("Hello!", font=("Arial", 45, "normal"))
    
    #Finished
    

else:
    makeup = easy.get_string("What Color of Makeup do you want?", "Makeup")
    hair = easy.get_string("What Color hair do you want?", "Hair")
    balloon = easy.get_string("What Color do you want the balloon?", "Balloon")
    
    #Poistion to draw balloon
    
    penny.penup()    
    penny.goto(-260, 100)
    penny.pendown()
    
    #Starts drawing balloon
    
    draw_square(penny, 20, balloon)
    penny.forward(20)
    penny.right(180)

    for counter in range(3):
        draw_square(penny, 20, balloon)
        penny.forward(20)
        
    penny.right(90)
    penny.forward(20)
    penny.right(90)
    penny.forward(50)

    for counter in range(2):
        draw_square(penny, 20, balloon)
        penny.forward(20)
    penny.left(90)

    draw_range_squares(penny, 20, 6, balloon)
    penny.forward(20)
    penny.left(180)

    draw_range_squares(penny, 20, 7, balloon)
    going_up(penny, 20)

    draw_range_squares(penny, 20, 8, balloon)
    penny.left(180)

    draw_range_squares(penny, 20, 8, balloon)
    going_up(penny, 20)

    draw_range_squares(penny, 20, 8, balloon)
    penny.forward(-20)
    penny.left(180)

    draw_range_squares(penny, 20, 7, balloon)
    going_up(penny, 20)

    draw_range_squares(penny, 20, 6, balloon)

    penny.penup()

    #balloon over

    penny.goto(-120, 100)

    #drawing clown hair
    
    penny.pendown()

    draw_range_squares(penny, 20, 4, hair)
    penny.forward(20)
    penny.right(180)

    draw_range_squares(penny, 20, 4, hair)

    going_up(penny, 20)

    draw_range_squares(penny, 20, 5, hair)

    penny.penup()
    penny.goto(105, 127)
    penny.pendown()

    draw_range_squares(penny, 20, 5, hair)
    penny.forward(-20)
    penny.left(180)

    draw_range_squares(penny, 20, 4, hair)

    penny.penup()
    penny.forward(20)
    going_up(penny, 20)
    penny.pendown()

    draw_range_squares(penny, 20, 4, hair)
    
    #Drawing the clowns head
    
    penny.color("white")
    penny.begin_fill()
    penny.circle(83, 180)
    penny.forward(20 * 4)
    penny.circle(83, 180)
    penny.end_fill()
    
    #Drawing the clowns makeup
    
    penny.penup()
    penny.goto(20, 200)
    penny.pendown()
    
    penny.color(makeup)
    penny.right(180)
    penny.right(90)
    penny.forward(-7)
    draw_square(penny, 7, makeup)
    penny.forward(7)
    penny.left(90)
    draw_range_squares(penny, 7, 13, makeup)
    
    penny.penup()
    penny.goto(-60, 200)
   
    draw_range_squares(penny, 7, 13, makeup)
    
    penny.penup()
    penny.goto(-67, 207)
    draw_square(penny, 7, makeup)
    
    
    penny.penup()
    penny.goto(40, 170)
    penny.right(90)
    
    #Drawing the right eye
    
    draw_range_squares(penny, 3, 14, "black")
    penny.left(90)
    for counter in range(5):
        draw_square(penny, 3, "black")
        penny.forward(3)
        penny.left(90)
        draw_square(penny, 3, "black")
        penny.forward(3)
        penny.right(90)
    penny.left(90)
    draw_range_squares(penny, 3, 3, "black")
    for counter in range(5):
        draw_square(penny, 3, "black")
        penny.forward(3)
        penny.left(90)
        draw_square(penny, 3, "black")
        penny.forward(3)
        penny.right(90)
    
    #Drawing the left eye
        
    penny.penup()
    penny.goto(-40, 170)
    penny.left(180)
    draw_range_squares(penny, 3, 14, "black")
    penny.left(90)
    for counter in range(5):
        draw_square(penny, 3, "black")
        penny.forward(3)
        penny.left(90)
        draw_square(penny, 3, "black")
        penny.forward(3)
        penny.right(90)
    penny.left(90)
    draw_range_squares(penny, 3, 3, "black")
    for counter in range(5):
        draw_square(penny, 3, "black")
        penny.forward(3)
        penny.left(90)
        draw_square(penny, 3, "black")
        penny.forward(3)
        penny.right(90)

    #Drawing the nose
        
    penny.penup()
    penny.goto(-30, 125)
    draw_square(penny, 30, makeup)
    
    
    #Drawing the mouth
    
    penny.penup()
    penny.goto(-60, 90)
    penny.right(90)
    for counter in range(4):
        draw_square(penny, 8, makeup)
        penny.forward(8)
        penny.left(90)
        draw_square(penny, 8, makeup)
        penny.forward(8)
        penny.right(90)
    penny.left(90)
    draw_range_squares(penny, 8, 3, makeup)
    for counter in range(4):
        draw_square(penny, 8, makeup)
        penny.forward(8)
        penny.left(90)
        draw_square(penny, 8, makeup)
        penny.forward(8)
        penny.right(90)
    
    #DRawing the balloon string
        
    penny.penup()
    penny.goto(-250, 75)
    penny.right(90)
    draw_range_squares(penny, 2, 90, "white")
    
    #Final Message
    
    penny.write("Hello!", font=("Arial", 45, "normal"))
    
    
    ##Finished
