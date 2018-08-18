#microbit turtle race
#Name Redacted
#5/1/2018

import microbit
import time
import turtle
import easygui_qt as gui
import random

def winner(finish, turtle_1, turtle_2) :
    if turtle_1.xcor() >= finish :
        return 0
    elif turtle_2.xcor() >= finish :
        return 1
    
def turtle_run(some_turtle, challenge) :
    some_turtle.forward(challenge)
    time.sleep(0.3)
    
def turtle_racer(some_turtle) :
    distance = random.randrange(2,7)
    some_turtle.forward(distance)
    time.sleep(0.1)

options = ["Single Player", "Two Player(WIP)", "Bot Race"]
difficulty = ["Easy", "Medium", "Hard"]
players = gui.get_choice("How many people are playing?", "Number of Players", options)

win = turtle.Screen()

tim = turtle.Turtle()
tim.up()
tim.shape('turtle')
tim.color('red')

alex = turtle.Turtle()
alex.up()
alex.shape('turtle')
alex.color('blue')

ref = turtle.Turtle()
ref.width(5)
ref.up()
ref.goto(300, -100)
ref.down()
ref.left(90)
ref.forward(200)

tim.goto(-350, 30)
alex.goto(-350, -30)

if players == 'Two Player' :

    while True :
        
        if microbit.button_a.was_pressed():
            tim.forward(5)
            time.sleep(0.1)
            
        elif microbit.button_b.was_pressed():
            alex.forward(5)
            time.sleep(0.1)
            
        win = winner(300, tim, alex)
        
        if win == 0 :
            ref.up()
            ref.goto(0,0)
            ref.write('Red Player wins!', move=False, align='center', font=('Comic Sans MS', 50, 'normal'))
            break
            
        elif win == 1 :
            ref.up()
            ref.goto(0,0)
            ref.write('Blue Player wins!', move=False, align='center', font=('Comic Sans MS', 50, 'normal'))
            break
            
elif players == 'Single Player' :
    
    button_touch = 'None'
    
    challenge = gui.get_choice("What difficulty would you like?", "Difficulty", difficulty)
    
    if challenge == 'Easy' :
        challenger = 3
    elif challenge == 'Medium' :
        challenger = 5
    elif challenge == 'Hard' :
        challenger = 6
    
    while True :
        
        time.sleep(.5)
        
        if microbit.button_a.was_pressed():
            button_touch = 'A'
        
        turtle_run(alex, challenger)
        
        if microbit.button_b.was_pressed() and button_touch == 'A':
            tim.forward(5)
            button_touch = 'None'
            
        win = winner(300, tim, alex)
        
        if win == 0 :
            ref.up()
            ref.goto(0,0)
            ref.write('Human wins!', move=False, align='center', font=('Comic Sans MS', 50, 'normal'))
            break
            
        elif win == 1 :
            ref.up()
            ref.goto(0,0)
            ref.write('Bot wins!', move=False, align='center', font=('Comic Sans MS', 50, 'normal'))
            break
            
elif players == 'Bot Race' :
    
    while True :
        
        turtle_racer(tim)
        
        turtle_racer(alex)
        
        win = winner(300, tim, alex)
        
        if win == 0 :
            ref.up()
            ref.goto(0,0)
            ref.color('red')
            ref.write('Red wins!', move=False, align='center', font=('Comic Sans MS', 50, 'normal'))
            break
            
        elif win == 1 :
            ref.up()
            ref.goto(0,0)
            ref.color('blue')
            ref.write('Blue wins!', move=False, align='center', font=('Comic Sans MS', 50, 'normal'))
            break