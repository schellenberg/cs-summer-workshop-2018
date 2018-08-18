#--------------------------------------------------------------------------------------------------------------
#Microbit Functions Assignment
#Name Redacted
#April 28, 2018
#--------------------------------------------------------------------------------------------------------------
import microbit
import time
import easygui_qt as easy


#fruitful and non-fruitful functions that represents the various outcomes of the microbit operations, please refer to docstrings for their functions
def check_win():
    """This fruitful boolean function checks if the current image displayed when user presses A matches desired image and returns a value."""
    if str(the_image) == "00400:00400:00900:00400:00400":
        return True
    else:
        return False
    
def lose_indicator(default_image, the_image):
    """This non-fruitful function represents the LED flash and sad face shown by the microbit if the user presses the A button and the dot is not on the line."""
    for i in range(3):
        microbit.display.show(default_image)
        time.sleep(0.2)
        microbit.display.show(the_image)
        time.sleep(0.2)
    microbit.display.show(microbit.Image.SAD)
    time.sleep(0.5)
    
def win_indicator():
    """This non-fruitful function represents the happy face shown by the microbit if the user presses the A button and the dot is on the line."""
    microbit.display.show(microbit.Image.HAPPY)
    time.sleep(0.5)

def show_score(gets, misses):
    """This non-fruitful function repersents the display of wins and losses by the microbit if the user presses the B button to check the current score."""
    for value in ("W", str(gets), "L", str(misses)):
                microbit.display.show(value)
                time.sleep(0.75)

def restart_game():
    """This non-fruitful function repersents the notices given and the retarting of the game by the microbit if the user reaches 5 losses."""
    microbit.display.scroll("You lose!")
    easy.show_message("You reached 5 losses, please try again!")
    
def end_game(the_time):
    """This non-fruitful function represetnts the gretting messages and time calculation of the game after user victory."""
    time_used = time.time() - the_time 
    microbit.display.scroll("You win!")
    easy.show_message("Great work, you win! It took you " + str(int(time_used)) + " seconds to complete the game!", "Victory!")
    easy.show_message("Hope that you enjoyed the game!", "Game Over!")
    time.sleep(2)
    microbit.display.clear()
    

    
    
#introduction message to player and instructions on the game
easy.show_message("""Welcome to the Line of Death game. Press A when you think the dot is on the line and press b to check your score. Reach 15 wins to win or 5 losses to lose. Good Luck!""", "Line of Death")

#initial settings including the default image and basic variables such as wins and looses
position = ["90400:", "09400:", "00900:", "00490:", "00409:", "00490:", "00900:", "09400:"]
default_image = "00400:" + "00400:" + "00400:" + "00400:" + "00400:"
default_image = microbit.Image(default_image)
wins = 0
losses = 0
sleep_time = 1
start_time = time.time()

#the game loop that will end after reaching 15 wins
while wins <= 14:
    
    #access variables from the previous list to loop the LED back and forth through the center line, the time inbetween is determined by a variable that will decrease
    for positions in position:
        the_image = "00400:" + "00400:" + str(positions) + "00400:" + "00400"
        the_image = microbit.Image(the_image)
        microbit.display.show(the_image)
        time.sleep(sleep_time)
        
        #the check conditions if button a is pressed
        if microbit.button_a.was_pressed():
            time.sleep(0.3)
            check_win()
            
            #The sleep time will shorten based on game progression or the game will be over at 15 wins 
            if check_win():
                wins += 1
                if wins < 5:
                    sleep_time -= 0.15
                    win_indicator()
                elif wins < 7:
                    sleep_time -= 0.1
                    win_indicator()
                elif wins < 15:
                    sleep_time -= 0.02
                    win_indicator()
                else:
                    end_game(start_time)
                    break
            
            #The lose count will increase and the game will be resetted and wins, losses, and sleep time value will reset to default value onec at 5 losses
            else:
                losses += 1
                if losses < 5:
                    lose_indicator(default_image, the_image)
                else:
                    restart_game()
                    wins = 0
                    losses = 0
                    sleep_time = 1
                    start_time = time.time()
                    
        #show score if button b is pressed
        if microbit.button_b.was_pressed():
            show_score(wins, losses)



    
            
        
        
        
        
        
    
