import turtle

def draw_square_from_midpoint_on_bottom(some_turtle, side_length):
    """Draws a square from the midpoint of the bottom of the square, using some_turtle and making every side side_length long."""
    
    # draw the first half of the bottom of the square
    some_turtle.forward(side_length/2)
    some_turtle.left(90)
    
    # draw the three full sides of the square 
    for full_side in range(3):
        some_turtle.forward(side_length)
        some_turtle.left(90)
        
    # finish the second half of the bottom of the square
    some_turtle.forward(side_length/2)

def draw_rotated_square_shape(some_turtle, side_length, number_of_squares):
    """Draws number_of_squares, rotating each time so that each square is drawn rotated around an origin point."""
    for square in range(number_of_squares):
        draw_square_from_midpoint_on_bottom(some_turtle, side_length)
        some_turtle.left(360/number_of_squares)

canvas = turtle.Screen()
canvas.bgcolor("lightgreen")

bob = turtle.Turtle()
bob.color("red")
bob.pensize(4)
bob.speed(7)

# face south before drawing first square
bob.right(90)
draw_rotated_square_shape(bob, 150, 5)