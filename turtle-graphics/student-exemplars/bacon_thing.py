# ------------------------------------------------------------------------------------------------------------------------------
# Python Drawing Assignment
# Name Redacted
# November 14, 2017
# ------------------------------------------------------------------------------------------------------------------------------

import turtle

wn = turtle.Screen()
#wn.tracer(10)
wn.bgcolor("light goldenrod yellow")

bill = turtle.Turtle()
bill.speed(0)

# this variable is the total amount of pixels in a single row
numsquares = 19

# this function creates one pixel
def drawsquare(color):
    bill.color(color)
    bill.begin_fill()
    for side in range(4):
        bill.forward(18)
        bill.left(90)
    bill.end_fill()
    bill.forward(18)

# this function allows us to move on to another row
def nextrow():
    bill.penup()
    bill.backward(numsquares * 18)
    bill.left(90)
    bill.forward(18)
    bill.right(90)
    bill.pendown()

# this function draws the pixels of a single row
def row(colors, squares):
    for j in range(len(colors)):            # repeats amount of colors there are in a single color list
        for k in range(squares[j]):         # repeats amount of corresponding squares there are to colors in a list
            drawsquare(colors[j])
    nextrow()

# this function draws a raw piece of bacon
def raw_bacon():
    colors = ["light goldenrod yellow", "black", "light goldenrod yellow", "black", "light goldenrod yellow"]
    squares = [6, 2, 4, 2, 5]
    row(colors, squares)

    for i in range(3):
        colors = ["light goldenrod yellow", "black", "light goldenrod yellow", "black", "light goldenrod yellow"]
        squares = [6, 1, 5, 1, 6]
        row(colors, squares)

    for i in range(3):
        colors = ["light goldenrod yellow", "pink", "white", "pink", "white", "pink", "light goldenrod yellow"]
        squares = [4, 1, 2, 7, 1, 1, 3]
        row(colors, squares)

    for i in range(3):
        colors = ["light goldenrod yellow", "pink", "white", "pink", "white", "pink", "light goldenrod yellow"]
        squares = [5, 1, 2, 7, 1, 1, 2]
        row(colors, squares)

    colors = ["light goldenrod yellow", "black", "light goldenrod yellow", "pink", "white", "pink", "white", "pink", "light goldenrod yellow", "black", "light goldenrod yellow"]
    squares = [1, 1, 2, 1, 2, 7, 1, 1, 1, 1, 1]
    row(colors, squares)

    for i in range(4):
        colors = ["black", "light goldenrod yellow", "pink", "white", "pink", "white", "pink", "light goldenrod yellow", "black"]
        squares = [1, 3, 1, 2, 7, 1, 1, 2, 1]
        row(colors, squares)

    colors = ["light goldenrod yellow", "black", "light goldenrod yellow", "pink", "white", "pink", "white", "pink", "light goldenrod yellow", "black", "light goldenrod yellow"]
    squares = [1, 1, 2, 1, 2, 7, 1, 1, 1, 1, 1]
    row(colors, squares)

    colors = ["light goldenrod yellow", "black", "pink", "white", "pink", "white", "pink", "black", "light goldenrod yellow"]
    squares = [2, 2, 1, 2, 7, 1, 1, 1, 2]
    row(colors, squares)

    for i in range(4):
        colors = ["light goldenrod yellow", "pink", "white", "pink", "white", "pink", "light goldenrod yellow"]
        squares = [4, 1, 2, 7, 1, 1, 3]
        row(colors, squares)

    colors = ["light goldenrod yellow", "pink", "white", "pink", "white", "pink", "light goldenrod yellow"]
    squares = [4, 1, 2, 7, 1, 1, 3]
    row(colors, squares)

    colors = ["light goldenrod yellow", "pink", "white", "pink", "black", "pink", "white", "pink", "light goldenrod yellow"]
    squares = [5, 1, 2, 2, 3, 2, 1, 1, 3]
    row(colors, squares)

    colors = ["light goldenrod yellow", "pink", "white", "pink", "white", "pink", "light goldenrod yellow"]
    squares = [4, 1, 2, 7, 1, 1, 3]
    row(colors, squares)

    colors = ["light goldenrod yellow", "pink", "white", "black", "pink", "black", "pink", "white", "pink", "light goldenrod yellow"]
    squares = [4, 1, 2, 1, 4, 1, 1, 1, 1, 2]
    row(colors, squares)

    for i in range(5):
        colors = ["light goldenrod yellow", "pink", "white", "pink", "white", "pink", "light goldenrod yellow"]
        squares = [4, 1, 2, 7, 1, 1, 3]
        row(colors, squares)
        
# this function draws a cooked piece of bacon
def cooked_bacon():
    colors = ["light goldenrod yellow", "black", "light goldenrod yellow", "black", "light goldenrod yellow"]
    squares = [6, 2, 4, 2, 5]
    row(colors, squares)

    for i in range(3):
        colors = ["light goldenrod yellow", "black", "light goldenrod yellow", "black", "light goldenrod yellow"]
        squares = [6, 1, 5, 1, 6]
        row(colors, squares)

    for i in range(3):
        colors = ["light goldenrod yellow", "chocolate", "white", "chocolate", "white", "chocolate", "light goldenrod yellow"]
        squares = [4, 1, 2, 7, 1, 1, 3]
        row(colors, squares)

    for i in range(3):
        colors = ["light goldenrod yellow", "chocolate", "white", "chocolate", "white", "chocolate", "light goldenrod yellow"]
        squares = [5, 1, 2, 7, 1, 1, 2]
        row(colors, squares)

    colors = ["light goldenrod yellow", "black", "light goldenrod yellow", "chocolate", "white", "chocolate", "white", "chocolate", "light goldenrod yellow", "black", "light goldenrod yellow"]
    squares = [1, 1, 2, 1, 2, 7, 1, 1, 1, 1, 1]
    row(colors, squares)

    for i in range(4):
        colors = ["black", "light goldenrod yellow", "chocolate", "white", "chocolate", "white", "chocolate", "light goldenrod yellow", "black"]
        squares = [1, 3, 1, 2, 7, 1, 1, 2, 1]
        row(colors, squares)

    colors = ["light goldenrod yellow", "black", "light goldenrod yellow", "chocolate", "white", "chocolate", "white", "chocolate", "light goldenrod yellow", "black", "light goldenrod yellow"]
    squares = [1, 1, 2, 1, 2, 7, 1, 1, 1, 1, 1]
    row(colors, squares)

    colors = ["light goldenrod yellow", "black", "chocolate", "white", "chocolate", "white", "chocolate", "black", "light goldenrod yellow"]
    squares = [2, 2, 1, 2, 7, 1, 1, 1, 2]
    row(colors, squares)

    for i in range(4):
        colors = ["light goldenrod yellow", "chocolate", "white", "chocolate", "white", "chocolate", "light goldenrod yellow"]
        squares = [4, 1, 2, 7, 1, 1, 3]
        row(colors, squares)

    colors = ["light goldenrod yellow", "chocolate", "white", "chocolate", "white", "chocolate", "light goldenrod yellow"]
    squares = [4, 1, 2, 7, 1, 1, 3]
    row(colors, squares)

    colors = ["light goldenrod yellow", "chocolate", "white", "chocolate", "black", "chocolate", "white", "chocolate", "light goldenrod yellow"]
    squares = [5, 1, 2, 2, 3, 2, 1, 1, 3]
    row(colors, squares)

    colors = ["light goldenrod yellow", "chocolate", "white", "chocolate", "white", "chocolate", "light goldenrod yellow"]
    squares = [4, 1, 2, 7, 1, 1, 3]
    row(colors, squares)

    colors = ["light goldenrod yellow", "chocolate", "white", "black", "chocolate", "black", "chocolate", "white", "chocolate", "light goldenrod yellow"]
    squares = [4, 1, 2, 1, 4, 1, 1, 1, 1, 2]
    row(colors, squares)

    for i in range(5):
        colors = ["light goldenrod yellow", "chocolate", "white", "chocolate", "white", "chocolate", "light goldenrod yellow"]
        squares = [4, 1, 2, 7, 1, 1, 3]
        row(colors, squares)
        
# this function draws a burnt piece of bacon
def burnt_bacon():
    colors = ["light goldenrod yellow", "black", "light goldenrod yellow", "black", "light goldenrod yellow"]
    squares = [6, 2, 4, 2, 5]
    row(colors, squares)

    for i in range(3):
        colors = ["light goldenrod yellow", "black", "light goldenrod yellow", "black", "light goldenrod yellow"]
        squares = [6, 1, 5, 1, 6]
        row(colors, squares)

    for i in range(3):
        colors = ["light goldenrod yellow", "saddle brown", "white", "saddle brown", "white", "saddle brown", "light goldenrod yellow"]
        squares = [4, 1, 2, 7, 1, 1, 3]
        row(colors, squares)

    for i in range(3):
        colors = ["light goldenrod yellow", "saddle brown", "white", "saddle brown", "white", "saddle brown", "light goldenrod yellow"]
        squares = [5, 1, 2, 7, 1, 1, 2]
        row(colors, squares)

    colors = ["light goldenrod yellow", "black", "light goldenrod yellow", "saddle brown", "white", "saddle brown", "white", "saddle brown", "light goldenrod yellow", "black", "light goldenrod yellow"]
    squares = [1, 1, 2, 1, 2, 7, 1, 1, 1, 1, 1]
    row(colors, squares)

    for i in range(4):
        colors = ["black", "light goldenrod yellow", "saddle brown", "white", "saddle brown", "white", "saddle brown", "light goldenrod yellow", "black"]
        squares = [1, 3, 1, 2, 7, 1, 1, 2, 1]
        row(colors, squares)

    colors = ["light goldenrod yellow", "black", "light goldenrod yellow", "saddle brown", "white", "saddle brown", "white", "saddle brown", "light goldenrod yellow", "black", "light goldenrod yellow"]
    squares = [1, 1, 2, 1, 2, 7, 1, 1, 1, 1, 1]
    row(colors, squares)

    colors = ["light goldenrod yellow", "black", "saddle brown", "white", "saddle brown", "white", "saddle brown", "black", "light goldenrod yellow"]
    squares = [2, 2, 1, 2, 7, 1, 1, 1, 2]
    row(colors, squares)

    for i in range(4):
        colors = ["light goldenrod yellow", "saddle brown", "white", "saddle brown", "white", "saddle brown", "light goldenrod yellow"]
        squares = [4, 1, 2, 7, 1, 1, 3]
        row(colors, squares)

    colors = ["light goldenrod yellow", "saddle brown", "white", "saddle brown", "white", "saddle brown", "light goldenrod yellow"]
    squares = [4, 1, 2, 7, 1, 1, 3]
    row(colors, squares)

    colors = ["light goldenrod yellow", "saddle brown", "white", "saddle brown", "black", "saddle brown", "white", "saddle brown", "light goldenrod yellow"]
    squares = [5, 1, 2, 2, 3, 2, 1, 1, 3]
    row(colors, squares)

    colors = ["light goldenrod yellow", "saddle brown", "white", "saddle brown", "white", "saddle brown", "light goldenrod yellow"]
    squares = [4, 1, 2, 7, 1, 1, 3]
    row(colors, squares)

    colors = ["light goldenrod yellow", "saddle brown", "white", "black", "saddle brown", "black", "saddle brown", "white", "saddle brown", "light goldenrod yellow"]
    squares = [4, 1, 2, 1, 4, 1, 1, 1, 1, 2]
    row(colors, squares)

    for i in range(5):
        colors = ["light goldenrod yellow", "saddle brown", "white", "saddle brown", "white", "saddle brown", "light goldenrod yellow"]
        squares = [4, 1, 2, 7, 1, 1, 3]
        row(colors, squares)
      
# this variable asks the user if he/she would like their bacon raw, cooked, or burnt
option = turtle.textinput("Menu", "Would you like your bacon raw, cooked, or burnt? ")

# this puts the turtle/pen in place to start drawing
bill.penup()
bill.goto(-185, -300)
bill.pendown()

# based on user input, a raw, cooked, or burnt piece of bacon is drawn
if option == "raw" or option == "Raw":
    raw_bacon()
elif option == "cooked" or option == "Cooked":
    cooked_bacon()
else:
    burnt_bacon()