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

# move the turtles to their starting locations
andy.up()
lance.up()
andy.goto(-200,40)
lance.goto(-200,-40)

# your code goes here

for step in range(150):
    andy_speed = random.randrange(1, 10)
    lance_speed = random.randrange(1, 10)

    andy.forward(andy_speed)
    lance.forward(lance_speed)
    
