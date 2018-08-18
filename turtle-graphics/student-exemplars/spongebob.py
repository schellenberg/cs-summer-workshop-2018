#########################################################################
# Name Redacted
# Computer Science 20
# Nov 10, 2017
#
# Turtles/Loops Assignment
# Purpose: Create a Python program that uses the Turtles module, and draws something cool. 
#########################################################################

import turtle

def draw_curve(some_turtle, repeat_number, radius, degrees_of_circle,turn_degrees):
    """Draw curve lines by some_turtle, use repeat_number represents times it repeats,radius represents radius of circle,degrees_of_circle represents rhe shape of circle,and turn_degrees represents number of degrees the next circle turns."""
    for side in range(repeat_number):
        some_turtle.circle(radius,degrees_of_circle)
        some_turtle.left(turn_degrees)

def draw_multi_circle(some_turtle,color,radius,degrees_of_circle):
    """Draw multi_circle by some_turtle,fill color by color, radius represents radius of circle,and degrees_of_circle represents shape of circle."""
    some_turtle.down()
    some_turtle.begin_fill()
    some_turtle.fillcolor(color)
    some_turtle.circle(radius,degrees_of_circle)
    some_turtle.end_fill()
    some_turtle.up()
    
def draw_short_line(some_turtle,x_1,y_1,x_2,y_2):
    """Draw_short_line by some_turtle,x_1 shows original x, y_1 shows original y, x_2 shows second x, and y_2 shows second y."""
    some_turtle.goto(x_1,y_1)
    some_turtle.down()
    some_turtle.goto(x_2,y_2)
    some_turtle.up()
    
def draw_circle(some_turtle,turn_degrees,color,radius,degrees):
    """Draw_circle by some_turtle, turn_degrees shows the direction, color shows the color of some_turtle,radius shows the radius of circle,degrees shows the shape of circle."""
    some_turtle.left(turn_degrees)
    some_turtle.color(color)
    some_turtle.down()
    some_turtle.circle(radius,degrees)
    some_turtle.up()
    
def draw_star(some_turtle, repeat_number, steps,radius, degrees,turn_degrees):
    """Draw_star by some_turtle, repeat_number shows times some_turtle repeats, steps shows numbers some_turtle moves, radius shows radius of circle,degrees shows shape of circle, and turn_degrees shows degrees some_turtle turns."""
    for star in range(repeat_number):
        some_turtle.forward(steps)
        some_turtle.circle(radius,degrees)
        some_turtle.forward(steps)
        some_turtle.right(turn_degrees)

def draw_circle_turn_direction(some_turtle,radius, degrees,turn_degrees):
    """Draw_circle_turn_direction by some_turtle, radius shows radius of circle, degrees shows shape of circle, and turn_degrees shows degrees some_turtle turns."""
    some_turtle.circle(radius,degrees)
    some_turtle.right(turn_degrees)
    
#########################################################################   
    
question = input("Do you want the spongebob to hold a star shape ballon or round shape ballon? Please enter star or round")

if question == "star":
    
    #set up all materials 
    the_window = turtle.Screen()
    the_window.tracer(2)
    pen = turtle.Turtle()
    pen.color("black")
    pen.pensize(5)
    the_window.bgcolor("lightskyblue")
    
    #start to draw square
    pen.up()
    pen.goto(-150,-50)
    pen.down()
    pen.right(90)
    pen.begin_fill()
    pen.fillcolor('gold')
    for shape in range(2):
        draw_curve(pen, 10, 10, 180,180)
        pen.left(90)
        draw_curve(pen, 12, 10, 180,180)
        pen.left(90)
    pen.end_fill()
    pen.up()
    
    #start to draw a cube
    pen.goto(50,-50)
    pen.left(20)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('gold')
    draw_curve(pen, 3, 10, 180,180)
    pen.left(70)
    draw_curve(pen, 10, 10, 180,180)
    pen.left(70)
    draw_curve(pen, 3, 10, 180,180)
    pen.end_fill()
    pen.left(110)
    draw_curve(pen, 12, 10, -180,180)
    pen.up()
    
    #left eye
    pen.goto(-90,145)
    draw_multi_circle(pen,'white',42,360)
    
    pen.goto(-67,118)
    draw_multi_circle(pen,'cornflowerblue',18,360)
    
    pen.goto(-65,108)
    draw_multi_circle(pen,'black',8,360)
   
    pen.goto(-74,107)
    pen.right(180)
    pen.color('white')
    draw_multi_circle(pen,'white',5,360)
    
    pen.goto(-67,118)
    pen.left(180)
    pen.color('black')
    pen.down()
    pen.circle(18,360)
    pen.up()
    
    #right eys
    pen.goto(-15,145)
    pen.right(360)
    pen.color('black')
    draw_multi_circle(pen,'white',42,360)
    
    pen.goto(7,118)
    draw_multi_circle(pen,'cornflowerblue',18,360)
    
    pen.goto(9,108)
    draw_multi_circle(pen,'black',8,360)
    
    pen.goto(0,107)
    pen.right(180)
    pen.color('white')
    draw_multi_circle(pen,'white',5,360)
    
    pen.goto(7,118)
    draw_circle(pen,180,'black',18,360)
    
    #eyelash
    draw_short_line(pen,-90,145,-92,155)
    
    draw_short_line(pen,-70,140,-68,150)
    
    draw_short_line(pen,-115,140,-118,150)

    draw_short_line(pen,-15,145,-17,155)
    
    draw_short_line(pen,5,140,7,150)
    
    draw_short_line(pen,-39,140,-42,150)
    
    #nose
    pen.goto(-52,68)
    pen.down()
    pen.right(150)
    pen.begin_fill()
    pen.fillcolor('salmon')
    pen.circle(12,-120)
    pen.left(230)
    pen.circle(12,170)
    pen.right(30)
    pen.circle(15,100)
    pen.end_fill()
    pen.up()
    
    #mouth
    pen.goto(-130,40)
    pen.right(30)
    draw_multi_circle(pen,'salmon',18,-250)
    
    pen.goto(30,42)
    pen.right(90)
    draw_multi_circle(pen,'salmon',18,250)
    
    pen.goto(-124,58)
    draw_circle(pen,250,'black',5,180)
    
    pen.goto(-122,50)
    draw_circle(pen,345,'black',100,90)
    
    pen.goto(20,58)
    draw_circle(pen,180,'black',5,-180)
    
    #teeth
    pen.goto(-90,29)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('white')
    pen.goto(-90,5)
    pen.right(45)
    pen.forward(30)
    pen.left(90)
    pen.forward(15)
    pen.end_fill()
    pen.up()
    
    pen.goto(-50,20)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('white')
    pen.goto(-50,5)
    pen.right(90)
    pen.forward(30)
    pen.left(90)
    pen.forward(17)
    pen.end_fill()
    pen.up()
    
    pen.goto(-122,50)
    draw_circle(pen,225,'black',100,90)
    
    #eyebrows
    pen.goto(-110,170)
    draw_circle(pen,180,'black',20,-80)

    pen.goto(10,170)
    draw_circle(pen,355,'black',20,80)
    
    #heat
    pen.goto(-10,190)
    pen.down()
    pen.left(180)
    pen.begin_fill()
    pen.fillcolor('dodgerblue')
    pen.goto(-10,270)
    pen.left(45)
    pen.circle(20,180)
    pen.goto(-50,190)
    pen.end_fill()
    pen.up()
    
    pen.goto(-50,230)
    pen.right(180)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('white')
    pen.left(180)
    pen.circle(20,180)
    pen.end_fill()
    pen.up()
    
    pen.goto(-15,227)
    pen.color('white')
    pen.left(2)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('white')
    pen.goto(-15,270)
    pen.circle(15,180)
    pen.goto(-45,229)
    pen.end_fill()
    pen.up()
    
    pen.goto(-30,190)
    pen.color('black')
    pen.right(135)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('darkblue')
    pen.goto(-50,220)
    pen.circle(20,180)
    pen.end_fill()
    pen.up()
    
    pen.goto(-10,190)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('gold')
    pen.right(220)
    draw_curve(pen, 4,10, 180,180)
    pen.end_fill()
    pen.up()
    
    #logo on the heat
    pen.goto(-30,270)
    pen.down()
    pen.right(90)
    pen.circle(3,360)
    pen.goto(-30,240)
    pen.up()
    
    draw_short_line(pen,-35,255,-25,255)
    
    pen.goto(-30,240)
    draw_circle(pen,90,'black',5,-180)
    
    pen.goto(-30,240)
    pen.down()
    pen.circle(5,180)
    pen.up()
        
    #body
    pen.goto(-150,-50)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('saddlebrown')
    pen.goto(-150,-125)
    pen.goto(50,-125)
    pen.goto(50,-50)
    pen.right(0.25)
    draw_curve(pen, 10, 10, -180,180)
    pen.end_fill()
    pen.up()
    
    pen.goto(50,-125)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('saddlebrown')
    pen.right(75)
    pen.forward(60)
    pen.left(75)
    pen.forward(79)
    pen.left(18)
    draw_curve(pen, 3,10, -180,180)
    pen.left(15)
    pen.goto(50,-125)
    pen.end_fill()
    pen.up()
    
    pen.goto(-150,-50)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('powderblue')
    pen.goto(-150,-90)
    pen.goto(50,-90)
    pen.goto(50,-50)
    pen.right(35)
    draw_curve(pen, 10, 10, -180,180)
    pen.end_fill()
    pen.up()
    
    pen.goto(50,-90)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('powderblue')
    pen.right(75)
    pen.forward(58)
    pen.left(77)
    pen.forward(45)
    pen.left(17)
    draw_curve(pen, 3, 10, -180,180)
    pen.left(15)
    pen.goto(50,-90)
    pen.end_fill()
    pen.up()
    
    #legs
    pen.goto(-110,-125)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('saddlebrown')
    pen.goto(-110,-140)
    pen.goto(-60,-140)
    pen.goto(-60,-125)
    pen.goto(-110,-125)
    pen.end_fill()
    pen.up()
    
    pen.goto(10,-125)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('saddlebrown')
    pen.goto(10,-140)
    pen.goto(50,-140)
    pen.goto(80,-130)
    pen.goto(80,-115)
    pen.goto(50,-125)
    pen.goto(10,-125)
    pen.end_fill()
    pen.up()
    
    pen.goto(-95,-140)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('gold')
    pen.left(130)
    pen.circle(70,40)
    pen.goto(-75,-188)
    pen.circle(70,-39)
    pen.goto(-95,-140)
    pen.end_fill()
    pen.up()
    
    pen.goto(30,-140)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('gold')
    pen.circle(70,40)
    pen.goto(50,-188)
    pen.circle(70,-39)
    pen.goto(30,-140)
    pen.end_fill()
    pen.up()
    
    #tie
    pen.goto(-70,-50)
    pen.right(140)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('firebrick')
    pen.goto(-60,-90)
    pen.goto(-70,-135)
    pen.goto(-50,-145)
    pen.goto(-30,-130)
    pen.goto(-40,-90)
    pen.goto(-30,-50)
    pen.end_fill()
    pen.up()
    
    draw_short_line(pen,-60,-90,-40,-90)
    
    pen.goto(-90,-50)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('powderblue')
    pen.left(180)
    pen.forward(30)
    pen.left(120)
    pen.forward(30)
    pen.end_fill()
    pen.up()
    
    pen.goto(-40,-50)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('powderblue')
    pen.right(120)
    pen.forward(30)
    pen.left(120)
    pen.forward(30)
    pen.end_fill()
    pen.up()
    
    pen.goto(-148,-48)
    pen.left(215)
    pen.color('black')
    pen.begin_fill()
    pen.fillcolor('gold')
    draw_curve(pen, 8, 10, 180,180)
    pen.end_fill()
    pen.up()
    
    #shoes
    pen.goto(-130,-182)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('black')
    pen.circle(20,360)
    pen.goto(-100,-188)
    pen.circle(10,360)
    pen.end_fill()
    pen.up()
    
    pen.goto(-115,-175)
    pen.begin_fill()
    pen.fillcolor('white')
    pen.circle(5,360)
    pen.end_fill()
    pen.up()
    
    pen.goto(-5,-182)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('black')
    pen.circle(20,360)
    pen.goto(25,-188)
    pen.circle(10,360)
    pen.end_fill()
    pen.up()
    
    pen.goto(10,-175)
    pen.begin_fill()
    pen.fillcolor('white')
    pen.circle(5,360)
    pen.end_fill()
    pen.up()
    
    #arms
    pen.goto(-160,0)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('gold')
    pen.goto(-220,-30)
    pen.right(180)
    draw_star(pen, 4, 15,3, 150,70)
    pen.goto(-170,-20)
    pen.end_fill()
    pen.up()
    
    pen.goto(-150,12)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('powderblue')
    pen.left(150)
    pen.forward(60)
    draw_circle_turn_direction(pen,20, -170,5)
    pen.forward(41)
    pen.right(29)
    draw_curve(pen, 2, 10, -180,180)
    pen.end_fill()
    pen.up()
    
    pen.goto(80,10)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('gold')
    pen.goto(150,-30)
    pen.right(140)
    draw_star(pen, 4, 15,3, 150,70)
    pen.goto(80,30)
    pen.end_fill()
    pen.up()
    
    pen.goto(80,30)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('powderblue')
    pen.left(10)
    draw_circle_turn_direction(pen,55, -70,290)
    draw_circle_turn_direction(pen,16, 120,300)
    draw_circle_turn_direction(pen,55,-70,13)
    pen.circle(20,-80)
    pen.end_fill()
    pen.up()
        
    #ballon
    pen.goto(155,-125)
    pen.down()
    pen.right(205)
    for side in range(4):
        draw_circle_turn_direction(pen,20, 180,180)
        draw_circle_turn_direction(pen,20, -180,180)
    pen.right(45)
    
    pen.begin_fill()
    pen.fillcolor('salmon')
    for star in range(5):
        pen.forward(20)
        pen.circle(20,180)
        pen.forward(20)
        pen.right(110)
    pen.end_fill()
    pen.up()
    
elif question == "round":
    
    #set up all materials 
    the_window = turtle.Screen()
    the_window.tracer(2)
    pen = turtle.Turtle()
    pen.color("black")
    pen.pensize(5)
    the_window.bgcolor("lightskyblue")
    
    #start to draw square
    pen.up()
    pen.goto(-150,-50)
    pen.down()
    pen.right(90)
    pen.begin_fill()
    pen.fillcolor('gold')
    for shape in range(2):
        draw_curve(pen, 10, 10, 180,180)
        pen.left(90)
        draw_curve(pen, 12, 10, 180,180)
        pen.left(90)
    pen.end_fill()
    pen.up()
    
    #start to draw a cube
    pen.goto(50,-50)
    pen.left(20)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('gold')
    draw_curve(pen, 3, 10, 180,180)
    pen.left(70)
    draw_curve(pen, 10, 10, 180,180)
    pen.left(70)
    draw_curve(pen, 3, 10, 180,180)
    pen.end_fill()
    pen.left(110)
    draw_curve(pen, 12, 10, -180,180)
    pen.up()
    
    #left eye
    pen.goto(-90,145)
    draw_multi_circle(pen,'white',42,360)
    
    pen.goto(-67,118)
    draw_multi_circle(pen,'cornflowerblue',18,360)
    
    pen.goto(-65,108)
    draw_multi_circle(pen,'black',8,360)
   
    pen.goto(-74,107)
    pen.right(180)
    pen.color('white')
    draw_multi_circle(pen,'white',5,360)
    
    pen.goto(-67,118)
    pen.left(180)
    pen.color('black')
    pen.down()
    pen.circle(18,360)
    pen.up()
    
    #right eys
    pen.goto(-15,145)
    pen.right(360)
    pen.color('black')
    draw_multi_circle(pen,'white',42,360)
    
    pen.goto(7,118)
    draw_multi_circle(pen,'cornflowerblue',18,360)
    
    pen.goto(9,108)
    draw_multi_circle(pen,'black',8,360)
    
    pen.goto(0,107)
    pen.right(180)
    pen.color('white')
    draw_multi_circle(pen,'white',5,360)
    
    pen.goto(7,118)
    draw_circle(pen,180,'black',18,360)
    
    #eyelash
    draw_short_line(pen,-90,145,-92,155)
    
    draw_short_line(pen,-70,140,-68,150)
    
    draw_short_line(pen,-115,140,-118,150)

    draw_short_line(pen,-15,145,-17,155)
    
    draw_short_line(pen,5,140,7,150)
    
    draw_short_line(pen,-39,140,-42,150)
    
    #nose
    pen.goto(-52,68)
    pen.down()
    pen.right(150)
    pen.begin_fill()
    pen.fillcolor('salmon')
    pen.circle(12,-120)
    pen.left(230)
    pen.circle(12,170)
    pen.right(30)
    pen.circle(15,100)
    pen.end_fill()
    pen.up()
    
    #mouth
    pen.goto(-130,40)
    pen.right(30)
    draw_multi_circle(pen,'salmon',18,-250)
    
    pen.goto(30,42)
    pen.right(90)
    draw_multi_circle(pen,'salmon',18,250)
    
    pen.goto(-124,58)
    draw_circle(pen,250,'black',5,180)
    
    pen.goto(-122,50)
    draw_circle(pen,345,'black',100,90)
    
    pen.goto(20,58)
    draw_circle(pen,180,'black',5,-180)
    
    #teeth
    pen.goto(-90,29)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('white')
    pen.goto(-90,5)
    pen.right(45)
    pen.forward(30)
    pen.left(90)
    pen.forward(15)
    pen.end_fill()
    pen.up()
    
    pen.goto(-50,20)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('white')
    pen.goto(-50,5)
    pen.right(90)
    pen.forward(30)
    pen.left(90)
    pen.forward(17)
    pen.end_fill()
    pen.up()
    
    pen.goto(-122,50)
    draw_circle(pen,225,'black',100,90)
    
    #eyebrows
    pen.goto(-110,170)
    draw_circle(pen,180,'black',20,-80)

    pen.goto(10,170)
    draw_circle(pen,355,'black',20,80)
    
    #heat
    pen.goto(-10,190)
    pen.down()
    pen.left(180)
    pen.begin_fill()
    pen.fillcolor('dodgerblue')
    pen.goto(-10,270)
    pen.left(45)
    pen.circle(20,180)
    pen.goto(-50,190)
    pen.end_fill()
    pen.up()
    
    pen.goto(-50,230)
    pen.right(180)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('white')
    pen.left(180)
    pen.circle(20,180)
    pen.end_fill()
    pen.up()
    
    pen.goto(-15,227)
    pen.color('white')
    pen.left(2)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('white')
    pen.goto(-15,270)
    pen.circle(15,180)
    pen.goto(-45,229)
    pen.end_fill()
    pen.up()
    
    pen.goto(-30,190)
    pen.color('black')
    pen.right(135)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('darkblue')
    pen.goto(-50,220)
    pen.circle(20,180)
    pen.end_fill()
    pen.up()
    
    pen.goto(-10,190)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('gold')
    pen.right(220)
    draw_curve(pen, 4,10, 180,180)
    pen.end_fill()
    pen.up()
    
    #logo on the heat
    pen.goto(-30,270)
    pen.down()
    pen.right(90)
    pen.circle(3,360)
    pen.goto(-30,240)
    pen.up()
    
    draw_short_line(pen,-35,255,-25,255)
    
    pen.goto(-30,240)
    draw_circle(pen,90,'black',5,-180)
    
    pen.goto(-30,240)
    pen.down()
    pen.circle(5,180)
    pen.up()
        
    #body
    pen.goto(-150,-50)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('saddlebrown')
    pen.goto(-150,-125)
    pen.goto(50,-125)
    pen.goto(50,-50)
    pen.right(0.25)
    draw_curve(pen, 10, 10, -180,180)
    pen.end_fill()
    pen.up()
    
    pen.goto(50,-125)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('saddlebrown')
    pen.right(75)
    pen.forward(60)
    pen.left(75)
    pen.forward(79)
    pen.left(18)
    draw_curve(pen, 3,10, -180,180)
    pen.left(15)
    pen.goto(50,-125)
    pen.end_fill()
    pen.up()
    
    pen.goto(-150,-50)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('powderblue')
    pen.goto(-150,-90)
    pen.goto(50,-90)
    pen.goto(50,-50)
    pen.right(35)
    draw_curve(pen, 10, 10, -180,180)
    pen.end_fill()
    pen.up()
    
    pen.goto(50,-90)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('powderblue')
    pen.right(75)
    pen.forward(58)
    pen.left(77)
    pen.forward(45)
    pen.left(17)
    draw_curve(pen, 3, 10, -180,180)
    pen.left(15)
    pen.goto(50,-90)
    pen.end_fill()
    pen.up()
    
    #legs
    pen.goto(-110,-125)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('saddlebrown')
    pen.goto(-110,-140)
    pen.goto(-60,-140)
    pen.goto(-60,-125)
    pen.goto(-110,-125)
    pen.end_fill()
    pen.up()
    
    pen.goto(10,-125)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('saddlebrown')
    pen.goto(10,-140)
    pen.goto(50,-140)
    pen.goto(80,-130)
    pen.goto(80,-115)
    pen.goto(50,-125)
    pen.goto(10,-125)
    pen.end_fill()
    pen.up()
    
    pen.goto(-95,-140)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('gold')
    pen.left(130)
    pen.circle(70,40)
    pen.goto(-75,-188)
    pen.circle(70,-39)
    pen.goto(-95,-140)
    pen.end_fill()
    pen.up()
    
    pen.goto(30,-140)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('gold')
    pen.circle(70,40)
    pen.goto(50,-188)
    pen.circle(70,-39)
    pen.goto(30,-140)
    pen.end_fill()
    pen.up()
    
    #tie
    pen.goto(-70,-50)
    pen.right(140)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('firebrick')
    pen.goto(-60,-90)
    pen.goto(-70,-135)
    pen.goto(-50,-145)
    pen.goto(-30,-130)
    pen.goto(-40,-90)
    pen.goto(-30,-50)
    pen.end_fill()
    pen.up()
    
    draw_short_line(pen,-60,-90,-40,-90)
    
    pen.goto(-90,-50)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('powderblue')
    pen.left(180)
    pen.forward(30)
    pen.left(120)
    pen.forward(30)
    pen.end_fill()
    pen.up()
    
    pen.goto(-40,-50)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('powderblue')
    pen.right(120)
    pen.forward(30)
    pen.left(120)
    pen.forward(30)
    pen.end_fill()
    pen.up()
    
    pen.goto(-148,-48)
    pen.left(215)
    pen.color('black')
    pen.begin_fill()
    pen.fillcolor('gold')
    draw_curve(pen, 8, 10, 180,180)
    pen.end_fill()
    pen.up()
    
    #shoes
    pen.goto(-130,-182)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('black')
    pen.circle(20,360)
    pen.goto(-100,-188)
    pen.circle(10,360)
    pen.end_fill()
    pen.up()
    
    pen.goto(-115,-175)
    pen.begin_fill()
    pen.fillcolor('white')
    pen.circle(5,360)
    pen.end_fill()
    pen.up()
    
    pen.goto(-5,-182)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('black')
    pen.circle(20,360)
    pen.goto(25,-188)
    pen.circle(10,360)
    pen.end_fill()
    pen.up()
    
    pen.goto(10,-175)
    pen.begin_fill()
    pen.fillcolor('white')
    pen.circle(5,360)
    pen.end_fill()
    pen.up()
    
    #arms
    pen.goto(-160,0)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('gold')
    pen.goto(-220,-30)
    pen.right(180)
    draw_star(pen, 4, 15,3, 150,70)
    pen.goto(-170,-20)
    pen.end_fill()
    pen.up()
    
    pen.goto(-150,12)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('powderblue')
    pen.left(150)
    pen.forward(60)
    draw_circle_turn_direction(pen,20, -170,5)
    pen.forward(41)
    pen.right(29)
    draw_curve(pen, 2, 10, -180,180)
    pen.end_fill()
    pen.up()
    
    pen.goto(80,10)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('gold')
    pen.goto(150,-30)
    pen.right(140)
    draw_star(pen, 4, 15,3, 150,70)
    pen.goto(80,30)
    pen.end_fill()
    pen.up()
    
    pen.goto(80,30)
    pen.down()
    pen.begin_fill()
    pen.fillcolor('powderblue')
    pen.left(10)
    draw_circle_turn_direction(pen,55, -70,290)
    draw_circle_turn_direction(pen,16, 120,300)
    draw_circle_turn_direction(pen,55,-70,13)
    pen.circle(20,-80)
    pen.end_fill()
    pen.up()
        
    #ballon
    pen.goto(155,-125)
    pen.down()
    pen.right(205)
    for side in range(4):
        draw_circle_turn_direction(pen,20, 180,180)
        draw_circle_turn_direction(pen,20, -180,180)
    pen.right(45)
    
    pen.begin_fill()
    pen.fillcolor('salmon')
    pen.circle(60,360)
    pen.end_fill()
    pen.up()
    
else:
    print("Please enter star or round")
    
    
 

    

    
    
    
    