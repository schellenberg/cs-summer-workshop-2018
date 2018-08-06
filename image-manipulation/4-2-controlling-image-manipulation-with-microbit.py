# if you attempt to run this code, and get a ModuleNotFoundError: No module named 'image',
# you need to (in Thonny), select Tools -> Manage Packages..., type in cs20-image, click
# search, then click install
# the same applies to cs20-microbitio
import image
import microbit

def increase_green(original_image, amount_of_green_to_add):
    width = original_image.get_width()
    height = original_image.get_height()
    new_image = image.EmptyImage(width, height)

    for row in range(height):
        for col in range(width):
            p = original_image.get_pixel(col, row)

            new_red = p.get_red()
            new_green = p.get_green() + amount_of_green_to_add
            new_blue = p.get_blue()

            new_pixel = image.Pixel(new_red, new_green, new_blue)

            new_image.set_pixel(col, row, new_pixel)
    return new_image

def negative(original_image):
    width = original_image.get_width()
    height = original_image.get_height()
    new_image = image.EmptyImage(width, height)

    for row in range(height):
        for col in range(width):
            p = original_image.get_pixel(col, row)

            new_red = 255 - p.get_red()
            new_green = 255 - p.get_green()
            new_blue = 255 - p.get_blue()

            new_pixel = image.Pixel(new_red, new_green, new_blue)

            new_image.set_pixel(col, row, new_pixel)
    return new_image


img_file = "sneakers.jpg"
img = image.Image(img_file)
win = image.ImageWin(img.get_width(), img.get_height())
img.draw(win)


still_playing = True

while still_playing:
    if microbit.button_a.was_pressed():
        x_tilt = microbit.accelerometer.get_x()
        converted_img = increase_green(img, x_tilt)
        converted_img.draw(win)

    if microbit.button_b.was_pressed():
        converted_img = negative(img)
        converted_img.draw(win)

    if microbit.accelerometer.get_z() > 0:
        still_playing = False