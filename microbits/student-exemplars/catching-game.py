#5/3/2018
#Name Redacted
#Catching Game


import microbit
import random
import time

catcherPOS = 2
slide = 0
fallerPOS = 0
score = 0

#lists of possible positions for objects
list = ["90000", "09000", "00900", "00090", "00009"]
image1_list = ["90000:00000:00000:00000:","00000:90000:00000:00000:","00000:00000:90000:00000:","00000:00000:00000:90000:","00000:00000:00000:00000:"]
image2_list = ["09000:00000:00000:00000:","00000:09000:00000:00000:","00000:00000:09000:00000:","00000:00000:00000:09000:","00000:00000:00000:00000:"]
image3_list = ["00900:00000:00000:00000:","00000:00900:00000:00000:","00000:00000:00900:00000:","00000:00000:00000:00900:","00000:00000:00000:00000:"]
image4_list = ["00090:00000:00000:00000:","00000:00090:00000:00000:","00000:00000:00090:00000:","00000:00000:00000:00090:","00000:00000:00000:00000:"]
image5_list = ["00009:00000:00000:00000:","00000:00009:00000:00000:","00000:00000:00009:00000:","00000:00000:00000:00009:","00000:00000:00000:00000:"]

#randomly selects position of falling light
def pick_fallerPOS():
    fallerPOS = random.randrange(0,5)
    return fallerPOS

#puts together image with positions of objects
def fall(catcherPOS, slide):
    image = microbit.Image(slide + list[catcherPOS])
    time.sleep(0.15)
    return image

def chill():
    time.sleep(2)

fallerPOS = pick_fallerPOS()

#takes input to control position of object, displays image to microbit, counts score
while True:
    if fallerPOS == 0:
        for counter in range(4):
            if microbit.button_a.was_pressed():
                if catcherPOS > 0:
                    catcherPOS = catcherPOS - 1
            elif microbit.button_b.was_pressed():
                if catcherPOS < 4:
                    catcherPOS = catcherPOS + 1
            microbit.display.show(fall(catcherPOS, image1_list[slide]))
            slide = slide + 1
            if slide > 3:
                slide = 0
                chill()
                if fallerPOS == catcherPOS:
                    score = score + 1
                    print("YOU WIN! Your score is:" + str(score))
                else:
                    print("YOU MISSED! Your score is:" + str(score))
                
                
        
    
    
    if fallerPOS == 1:
        for counter in range(4):
            if microbit.button_a.was_pressed():
                if catcherPOS > 0:
                    catcherPOS = catcherPOS - 1
            elif microbit.button_b.was_pressed():
                if catcherPOS < 4:
                    catcherPOS = catcherPOS + 1
            microbit.display.show(fall(catcherPOS, image2_list[slide]))
            slide = slide + 1
            if slide > 3:
                slide = 0
                chill()
                if fallerPOS == catcherPOS:
                    score = score + 1
                    print("YOU WIN! Your score is:" + str(score))
                else:
                    print("YOU MISSED! Your score is:" + str(score))
                
        
    
    
    if fallerPOS == 2:
        for counter in range(4):
            if microbit.button_a.was_pressed():
                if catcherPOS > 0:
                    catcherPOS = catcherPOS - 1
            elif microbit.button_b.was_pressed():
                if catcherPOS < 4:
                    catcherPOS = catcherPOS + 1
            microbit.display.show(fall(catcherPOS, image3_list[slide]))
            slide = slide + 1
            if slide > 3:
                slide = 0
                chill()
                if fallerPOS == catcherPOS:
                    score = score + 1
                    print("YOU WIN! Your score is:" + str(score))
                else:
                    print("YOU MISSED! Your score is:" + str(score))
               
        
    
    
    if fallerPOS == 3:
        for counter in range(4):
            if microbit.button_a.was_pressed():
                if catcherPOS > 0:
                    catcherPOS = catcherPOS - 1
            elif microbit.button_b.was_pressed():
                if catcherPOS < 4:
                    catcherPOS = catcherPOS + 1
            microbit.display.show(fall(catcherPOS, image4_list[slide]))
            slide = slide + 1
            if slide > 3:
                slide = 0
                chill()
                if fallerPOS == catcherPOS:
                    score = score + 1
                    print("YOU WIN! Your score is:" + str(score))
                else:
                    print("YOU MISSED! Your score is:" + str(score))
                
        
    
    
    if fallerPOS == 4:
        for counter in range(4):
            if microbit.button_a.was_pressed():
                if catcherPOS > 0:
                    catcherPOS = catcherPOS - 1
            elif microbit.button_b.was_pressed():
                if catcherPOS < 4:
                    catcherPOS = catcherPOS + 1
            microbit.display.show(fall(catcherPOS, image5_list[slide]))
            slide = slide + 1
            if slide > 3:
                slide = 0
                chill()
                if fallerPOS == catcherPOS:
                    score = score + 1
                    print("YOU WIN! Your score is:" + str(score))
                else:
                    print("YOU MISSED! Your score is:" + str(score))
                
#randomly selects position of next falling object
    fallerPOS = pick_fallerPOS()
                
            
        

