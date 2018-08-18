#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Name Redacted
# Computer Science 20
# April 27th 2018

# Driving game
# Purpose: Game where you dodge obstacles by pressing the A and B buttons on the microbit
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

import random
import time
import microbit
import easygui as easy

#Defines variables
obstacle_x = random.randint(-2, 2)
obstacle_y = 2
car_x = 0
car_y = -2
game_slowness = 10
has_not_crashed = True
has_lifted_b = True
has_lifted_a = True
timer_to_speed_increase = 0
loops_since_fall = 0
score = 0
CRASH = microbit.Image("90909:09090:99099:09090:90909")
GAME_SPEED_INCREASE = 100

def change_frame_pixel(x_cor, y_cor, brightness, frame):
    """Changes a single pixel in the current frame"""
    #Prevents changed values from being out of range of the screen
    if x_cor > 2:
        x_cor = 2
    elif x_cor < -2:
        x_cor = -2
    if y_cor > 2:
        y_cor = 2
    elif y_cor < -2:
        y_cor = -2
    #Changes the pixel depending on the x,y values
    if y_cor == 2:
        frame[0][x_cor + 2] = brightness
    elif y_cor == 1:
        frame[1][x_cor + 2] = brightness
    elif y_cor == 0:
        frame[2][x_cor + 2] = brightness
    elif y_cor == -1:
        frame[3][x_cor + 2] = brightness
    elif y_cor == -2:
        frame[4][x_cor + 2] = brightness
    
    return frame
        
def display_frame(frame):
    """Converts the frame from a list of rows to a string, and then into a micro:bit image, and then draws the frame"""
    row_0_str = str(frame[0][0]) + str(frame[0][1]) + str(frame[0][2]) + str(frame[0][3]) + str(frame[0][4])
    row_1_str = str(frame[1][0]) + str(frame[1][1]) + str(frame[1][2]) + str(frame[1][3]) + str(frame[1][4])
    row_2_str = str(frame[2][0]) + str(frame[2][1]) + str(frame[2][2]) + str(frame[2][3]) + str(frame[2][4])
    row_3_str = str(frame[3][0]) + str(frame[3][1]) + str(frame[3][2]) + str(frame[3][3]) + str(frame[3][4])
    row_4_str = str(frame[4][0]) + str(frame[4][1]) + str(frame[4][2]) + str(frame[4][3]) + str(frame[4][4])
    image_string = row_0_str + ":" + row_1_str + ":" + row_2_str + ":" + row_3_str + ":" + row_4_str
    image = microbit.Image(image_string)
    microbit.display.show(image)
    
def draw_car(x_cor, y_cor, frame):
    """Draws a square 'car' with its bottom left corner at x_cor, y_cor"""
    frame = change_frame_pixel(x_cor, y_cor, 9, frame)
    frame = change_frame_pixel((x_cor + 1), y_cor, 9, frame)
    frame = change_frame_pixel((x_cor + 1), (y_cor + 1), 9, frame)
    frame = change_frame_pixel(x_cor, (y_cor + 1), 9, frame)
    return frame
    
def draw_obstacle(x_cor, y_cor, frame):
    """Draws a dot at x,y"""
    frame = change_frame_pixel(x_cor, y_cor, 9, frame)
    return frame



while True:
    #Main menu (asks user to either start game or exit)
    start_choice = easy.boolbox("Welcome to the Micro:Bit Driving Game! \nPress A and B to move your car and dodge the obstacles", "Welcome", ["Play", "Exit"])
    if start_choice == False:
        break
    #Countdown from 3 seconds on microbit screen before game
    for countdown in [3,2,1]:
        microbit.display.show(str(countdown))
        time.sleep(1)
    while has_not_crashed != False:
        #Clears frame
        row0 = [0,0,0,0,0]
        row1 = [0,0,0,0,0]
        row2 = [0,0,0,0,0]
        row3 = [0,0,0,0,0]
        row4 = [0,0,0,0,0]
        frame = [row0, row1, row2, row3, row4]
        
        #Car controls (car only 
        if microbit.button_b.is_pressed() and car_x != 1:
            if has_lifted_b == True:
                car_x = car_x + 1
                has_lifted_b = False
        else:
            has_lifted_b = True
            
        if microbit.button_a.is_pressed() and car_x != -2:
            if has_lifted_a == True:
                car_x = car_x - 1
                has_lifted_a = False
        else:
            has_lifted_a = True
                    
        #Crash detection
        if obstacle_x == car_x or obstacle_x == (car_x + 1):
            if obstacle_y == car_y or obstacle_y == (car_y + 1):
                has_not_crashed = False
                
        #Obstacle descends every few game loops, speeding up as the game progresses (game slowness is the number of loops until the object descends one pixel)
        if loops_since_fall == game_slowness or loops_since_fall == (game_slowness + 1):
            #Loop counter resets to 0
            loops_since_fall = 0
            #Score increases every time the obstacle hits the bottom of the screen
            if obstacle_y == -2:
                obstacle_y = 2
                obstacle_x = random.randint(-2, 2)
                score = score + 1
            else:
                obstacle_y = obstacle_y - 1
                
        #Draws car and obstacle
        frame = draw_obstacle(obstacle_x, obstacle_y, frame)
        frame = draw_car(car_x, car_y, frame)
        
        #Displays the current frame
        display_frame(frame)
        
        #Game speeds up every sixty loops by decreasing game slowness
        if timer_to_speed_increase == GAME_SPEED_INCREASE:
            if game_slowness > 4:
                game_slowness = game_slowness - 1
                timer_to_speed_increase = 0
                
        #Loop counters increase
        loops_since_fall = loops_since_fall + 1
        timer_to_speed_increase = timer_to_speed_increase + 1
        
#What happens when you crash
    microbit.display.show(CRASH)
    continue_choice = easy.boolbox("You crashed your car! Your score was " + str(score) + ".", "Game over", ["Continue", "Exit"])
    if continue_choice == False:
        break
    
    #Variables reset
    has_not_crashed = True
    timer_to_speed_increase = 0
    loops_since_fall = 0
    obstacle_x = random.randint(-2, 2)
    game_slowness = 10
    obstacle_y = 2
    car_x = 0
    score = 0