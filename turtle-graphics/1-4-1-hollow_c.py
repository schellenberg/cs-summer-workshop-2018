import turtle

the_window = turtle.Screen()
the_window.bgcolor("blue")

justyn = turtle.Turtle()
justyn.color("lightblue")
justyn.pensize(5)
justyn.speed(5)

justyn.right(-90)
for side in range(2):
    justyn.forward(200)
    justyn.right(90)

justyn.forward(30)
justyn.right(90)
justyn.forward(170)
justyn.right(-90)
justyn.forward(140)
justyn.right(-90)
justyn.forward(170)
justyn.right(90)
justyn.forward(30)

justyn.right(90)
justyn.forward(200)
justyn.right(90)

