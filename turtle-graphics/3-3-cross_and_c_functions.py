import turtle

def draw_cross(some_turtle, side_length):
    """Draws a cross shape with the given some_turtle, with each side being of side_length."""
    for tower in range(4):
        for side in range(3):
            some_turtle.forward(side_length)
            some_turtle.left(90)
        some_turtle.left(180)


def draw_c(a_turtle, longest_side_length, width_of_c):
    """Draws a hollow C shape with a_turtle. You can change the longest_side_length, and the width_of_c, and the function will calculate the lengths of the other sides."""
    
    a_turtle.left(90)
    #get to a better starting location
    a_turtle.left(90)
    a_turtle.up()
    a_turtle.backward(longest_side_length)
    a_turtle.down()

    for side in range(3):
        a_turtle.forward(longest_side_length)
        a_turtle.right(90)

    a_turtle.forward(width_of_c)
    a_turtle.right(90)
    a_turtle.forward(longest_side_length-width_of_c)
    a_turtle.left(90)
    a_turtle.forward(longest_side_length-2*width_of_c)
    a_turtle.left(90)
    a_turtle.forward(longest_side_length-width_of_c)
    a_turtle.right(90)
    a_turtle.forward(width_of_c)

    #put a_turtle back to the start
    a_turtle.right(90)
    a_turtle.forward(longest_side_length)
    a_turtle.right(90)

canvas = turtle.Screen()
canvas.bgcolor("lightgreen")

ramisa = turtle.Turtle()
ramisa.color("blue")
ramisa.pensize(4)
ramisa.speed(7)

#draw_cross(ramisa, 150)
draw_c(ramisa, 250, 50)