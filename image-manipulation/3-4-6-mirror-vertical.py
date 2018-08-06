# if you attempt to run this code, and get a ModuleNotFoundError: No module named 'image',
# you need to (in Thonny), select Tools -> Manage Packages..., type in cs20-image, click
# search, then click install
import image

# open an image
img = image.Image("giraffe.jpg")

# figure out how large the image is
width = img.get_width()
height = img.get_height()

# make a window to draw on
win = image.ImageWin(width, height)

# draw the original image onto the window
img.draw(win)

# use a nested for loop to look at every pixel in the image
for x in range(width):
    for y in range(height):
        if y <= height/2:
            # get the current pixel
            this_pixel = img.get_pixel(x, y)
        else:
            distance_from_midline = y - height/2
            this_pixel = img.get_pixel(x, height/2 - distance_from_midline)

        # access the amount of red, green and blue for this pixel
        r = this_pixel.get_red()
        g = this_pixel.get_green()
        b = this_pixel.get_blue()

        new_pixel = image.Pixel(r, g, b)

        # reassign the pixel value in the image to be the changed version
        img.set_pixel(x, y, new_pixel)

    # draw the changed image to the window
    img.draw(win)
