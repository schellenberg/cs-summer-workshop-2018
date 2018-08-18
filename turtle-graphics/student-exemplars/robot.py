#-------------------------------------------------------------------------------
# Name:        Spiral Susy
# Purpose: To create a picture that includes two for loops and one if/elif/else block.
#
# Author:      Name Redacted
#
# Created:     03/04/2015
# Licence:     CC
#-------------------------------------------------------------------------------
#getting user input about skirt design
skirtDesign=input("Do you want the skirt to have a 'diamond' pattern, 'hexagon' pattern, or 'octagon' pattern?")

#setup turtles screen
import turtle

window = turtle.Screen()
#window.tracer(10)
window.bgcolor("black")

#defining setup of the turtle
def setup_turtle_direction(aTurtle,x_coordinate,y_coordinate,angle):
    aTurtle.pu()
    aTurtle.goto(x_coordinate,y_coordinate)
    aTurtle.setheading(angle)
    aTurtle.pd()

def setupTurtle(aTurtle,x_coordinate,y_coordinate):
    aTurtle.pu()
    aTurtle.goto(x_coordinate,y_coordinate)
    aTurtle.pd()

#defining square
def draw_square(aTurtle,length):
    for i in range(4):
        aTurtle.forward(length)
        aTurtle.left(90)

#defining diamond
def drawDiamond(aTurtle,length):
    aTurtle.left(45)
    draw_square(aTurtle,length)

#defining a regular polygon
def drawShape(aTurtle,sides,length):
    for i in range(sides):
        aTurtle.forward(length)
        aTurtle.right(360/sides)

#defining a spiral
def drawSpiral(aTurtle,radius,rotations):
    for i in range (rotations):
        aTurtle.circle(radius,180)
        radius = radius-(radius*.2)

#setup susy turtle
susy = turtle.Turtle()
susy.color("cyan")
susy.pensize(1)
susy.speed(10)
aTurtle = susy

#drawing anterior side of the head
setup_turtle_direction(susy,0,300,290)
susy.goto(64.8,124)
susy.right(80)
susy.forward(152)
susy.right(80)
susy.forward(28.125)
susy.pu()
susy.forward(12)
susy.pd()
susy.forward(100)
setup_turtle_direction(susy,0,300,210)
susy.forward(161)

#drawing flower
susy.color("lightGoldenrod3")
setupTurtle(susy,-161,202)
susy.circle(18)
susy.color("lightGoldenrodYellow")
setupTurtle(susy,-150,220)
susy.circle(9)
setupTurtle(susy,-135,211)
susy.circle(9)
setupTurtle(susy,-130,194)
susy.circle(9)
setupTurtle(susy,-135,178)
susy.circle(9)
setupTurtle(susy,-151,168)
susy.circle(9)
setupTurtle(susy,-168,170)
susy.circle(9)
setupTurtle(susy,-182,185)
susy.circle(10)
setupTurtle(susy,-184,205)
susy.circle(10)
setupTurtle(susy,-170,219)
susy.circle(10)

#drawing antenna
susy.color("pale turquoise")
setupTurtle(susy,-100,256)
susy.circle(6,-180)
setupTurtle(susy,-78,254)
susy.circle(6,-180)
setup_turtle_direction(susy,-100,257,0)
susy.circle(17.3,-303)
susy.color("turquoise")
setupTurtle(susy,-95,270)
susy.circle(8)

#drawing side of the head
susy.color("cyan")
setup_turtle_direction(susy,0,300,337)
susy.forward(87.5)
susy.right(60)
susy.forward(150)
susy.right(110)
susy.goto(64.8,124)

#drawing bottom of head
susy.pu()
susy.backward(36)
susy.pd()
susy.goto(24,62)
setup_turtle_direction(susy,-67,49,350)
susy.forward(25)

#drawing throat
susy.color("pale turquoise")
setup_turtle_direction(susy,20,50,0)
susy.circle(8)
setupTurtle(susy,15,66)
susy.circle(6)
setupTurtle(susy,15,23)
susy.circle(13)

#drawing ear
setupTurtle(susy,64,190)
susy.circle(13)
setupTurtle(susy,62,188)
susy.circle(15,-180)
setup_turtle_direction(susy,67,202,30)
susy.forward(32)
setupTurtle(susy,101,216)
susy.circle(4)

#drawing eyes
susy.color("white")
setup_turtle_direction(susy,-80,150,0)
susy.circle(28)
setupTurtle(susy,-95,175)
susy.circle(6)
setupTurtle(susy,-29,180)
susy.circle(37)
setupTurtle(susy,-52,210)
susy.circle(7)

#drawing mouth
susy.color("pink")
susy.pensize(2)
setup_turtle_direction(susy,-60,100,345)
susy.circle(50,100)
setup_turtle_direction(susy,0,147,310)
susy.forward(15)

#drawing top of body
susy.color("cyan")
susy.pensize(1)
setup_turtle_direction(susy,-59,40.625,10)
susy.forward(72)
susy.pu()
susy.forward(9)
susy.right(45)
susy.forward(9)
susy.pd()
susy.forward(56.625)

#drawing anterior face of the body
setup_turtle_direction(susy,-59,40.625,330)
susy.forward(93.75)
susy.right(79)
susy.forward(105)
susy.right(101)
susy.forward(115)
susy.right(100)
susy.goto(-59,40.625)

#drawing details on body
setup_turtle_direction(susy,-20,19,245)
susy.forward(104)
setupTurtle(susy,-32,13)
susy.color("lightGoldenrodYellow")
for i in range(7):
    susy.circle(3)
    susy.pu()
    susy.forward(13)
    susy.pd()

#drawing side of the body
susy.color("cyan")
susy.pu()
susy.goto(-59,40.625)
susy.setheading(330)
susy.forward(93.75)
susy.left(55)
susy.pd()
susy.forward(56.25)
susy.right(125)
susy.forward(100)
susy.right(60)
susy.goto(-11,-107)

#drawing left arm
susy.color("pale turquoise")
setupTurtle(susy,-100,15)
susy.circle(12)
setupTurtle(susy,-117,32)
susy.circle(12)
setupTurtle(susy,-115,57)
susy.circle(12)
setupTurtle(susy,-100,77)
susy.circle(12)
setupTurtle(susy,-81,91)
susy.circle(12,180)
susy.left(90)
susy.forward(24)

#drawing right arm
susy.color("pale turquoise")
setup_turtle_direction(susy,40,-40,0)
susy.circle(12)
setupTurtle(susy,48,-63)
susy.circle(12)
setupTurtle(susy,73,-65)
susy.circle(12)
setupTurtle(susy,93,-55)
susy.circle(12)
setup_turtle_direction(susy,122,-43,30)
susy.circle(15,-180)
susy.left(90)
susy.forward(30)

#drawing flower in hand
susy.color("springGreen")
setup_turtle_direction(susy,121,-16,260)
susy.forward(20)
susy.pu()
susy.forward(11)
susy.pd()
susy.forward(15)
susy.color("lightGoldenrodYellow")
setupTurtle(susy,111,-2)
drawSpiral(susy,13,5)

#drawing skirt top
susy.color("cyan")
setup_turtle_direction(susy,-11,-107,170)
susy.forward(100)
susy.right(135)
susy.forward(38)
susy.color("pale turquoise")
setup_turtle_direction(susy,-65,-76,200)
susy.circle(8.5,280)

#drawing anterior side of the skirt
susy.color("cyan")
setup_turtle_direction(susy,-11,-107,279)
susy.forward(81.25)
susy.right(110)
susy.forward(153)
susy.right(110)
susy.forward(81.25)

#drawing the design on the skirt
susy.color("pale turquoise")
if skirtDesign =="diamond":
    setup_turtle_direction(susy,-90,-132,260)
    drawDiamond(susy,30)
elif skirtDesign == "hexagon":
    setup_turtle_direction(susy,-78,-118,350)
    drawShape(susy,6,20)
else:
    setup_turtle_direction(susy,-78,-109,350)
    drawShape(susy,8,20)

#drawing side of the skirt
susy.color("cyan")
susy.pu()
susy.goto(-11,-107)
susy.setheading(279)
susy.forward(81.25)
susy.left(105)
susy.pd()
susy.forward(109)
susy.left(101)
susy.forward(79)

#drawing legs
susy.color("pale turquoise")
setup_turtle_direction(susy,-50,-177,210)
susy.circle(13,288)
setup_turtle_direction(susy,-120,-166,210)
susy.circle(13,288)

#drawing left foot (anterior side)
setup_turtle_direction(susy,-105,-192,170)
draw_square(susy,25)

#drawing left foot(side)
setup_turtle_direction(susy,-104,-192,30)
susy.forward(10)
susy.right(126)
susy.forward(25)
susy.right(54)
susy.forward(13)

#drawing left foot(top)
setup_turtle_direction(susy,-130,-189,30)
susy.forward(6)
setup_turtle_direction(susy,-95,-186,170)
susy.forward(8)

#drawing right foot(anterior)
setup_turtle_direction(susy,-36,-203,170)
draw_square(susy,25)

#drawing right foot(side)
setup_turtle_direction(susy,-35,-203,30)
susy.forward(10)
susy.right(126)
susy.forward(25)
susy.right(54)
susy.forward(13)

#drawing right foot(top)
setup_turtle_direction(susy,-58,-198,30)
susy.forward(6)
setup_turtle_direction(susy,-25,-197,170)
susy.forward(8)

#drawing spirals
susy.color("violet")
setupTurtle(susy,200,180)
drawSpiral(susy,28,12)
susy.color("plum")
setupTurtle(susy,270,183)
drawSpiral(susy,35,15)
susy.color("orchid")
setupTurtle(susy,-255,-100)
drawSpiral(susy,12,8)
susy.color("lavender")
setupTurtle(susy,-250,-60)
drawSpiral(susy,29,10)
susy.color("medium purple")
setupTurtle(susy,-310,-90)
drawSpiral(susy,35,10)
susy.color("lavenderBlush")
setupTurtle(susy,212,73)
drawSpiral(susy,24,12)

turtle.exitonclick()