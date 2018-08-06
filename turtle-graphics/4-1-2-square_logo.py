import turtle

def draw_square(some_turtle, side_length):
    """Draw a square (from bottom left corner), with some_turtle and sides being side_length long."""
    for side in range(4):
        some_turtle.forward(side_length)
        some_turtle.left(90)

def draw_square_from_centre(a_turtle, side_length):
    """Draw a sqaure (from the centre point) with a_turtle, and sides being side_length long."""
    
    #go to starting location (bottom left corner)
    a_turtle.up()
    for i in range(2):
        a_turtle.right(90)
        a_turtle.forward(side_length/2)
    a_turtle.right(180)
    a_turtle.down()
    
    #draw the square
    draw_square(a_turtle, side_length)
    
    #go back to the origin (centre point)
    a_turtle.up()
    for i in range(2):
        a_turtle.forward(side_length/2)
        a_turtle.left(90)
    a_turtle.right(180)
    a_turtle.down()
    

window = turtle.Screen()
window.bgcolor("lightgreen")

cody = turtle.Turtle()
cody.color("green")
cody.pensize(4)

draw_square_from_centre(cody, 200)
cody.left(45)
draw_square_from_centre(cody, 200)
