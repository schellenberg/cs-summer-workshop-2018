# Dan Schellenberg
# Drawing a square of any size
#   Note that this program is inefficient. We haven't explored for/while loops yet.

import turtle

the_window = turtle.Screen()
the_background = the_window.textinput("Background Color", "Please enter the background color")
the_window.bgcolor(the_background)

sarah = turtle.Turtle()
turtle_color = the_window.textinput("Turtle Color", "Please enter the color of the turtle")
sarah.color(turtle_color)

pen_width = the_window.numinput("Width", "Please enter the width of the pen")
sarah.pensize(pen_width)

length_of_sides = the_window.numinput("Length", "Please enter the length of each side")

#draw a square!
sarah.forward(length_of_sides)
sarah.left(90)
sarah.forward(length_of_sides)
sarah.left(90)
sarah.forward(length_of_sides)
sarah.left(90)
sarah.forward(length_of_sides)
sarah.left(90)

sarah.hideturtle()