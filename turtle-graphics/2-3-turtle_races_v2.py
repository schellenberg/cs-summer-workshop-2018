import turtle
import random

window = turtle.Screen()
window.bgcolor('lightblue')

#create the turtles, and specify their attributes
lance = turtle.Turtle()
andy = turtle.Turtle()
lance.color('red')
andy.color('blue')
lance.shape('turtle')
andy.shape('turtle')

#draw a finish line
ref = turtle.Turtle()
ref.up()
ref.goto(200, -100)
ref.down()
ref.pensize(4)
ref.goto(200, 100)
ref.hideturtle()

# move the turtles to their starting locations
andy.up()
lance.up()
andy.goto(-200,40)
lance.goto(-200,-40)


while andy.xcor() < 200 and lance.xcor() < 200:
    andy_speed = random.randrange(1, 10)
    lance_speed = random.randrange(1, 10)

    andy.forward(andy_speed)
    lance.forward(lance_speed)

# you may want to simply print to the console (depending on the class you're teaching)...
if andy.xcor() > lance.xcor():
    andy.write("I win!", font=("Arial", 32, "normal"))
elif lance.xcor() > andy.xcor():
    lance.write("I win!", font=("Arial", 32, "normal"))
else:
    andy.write("Tie.", font=("Arial", 32, "normal"))
    lance.write("Tie.", font=("Arial", 32, "normal"))
