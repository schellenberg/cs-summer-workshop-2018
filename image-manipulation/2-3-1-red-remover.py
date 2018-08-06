# if you attempt to run this code, and get a ModuleNotFoundError: No module named 'image',
# you need to (in Thonny), select Tools -> Manage Packages..., type in cs20-image, click
# search, then click install
import image

img = image.Image("sneakers.jpg")
width = img.get_width()
height = img.get_height()

canvas = image.ImageWin(width, height)
img.draw(canvas)

for y in range(height):
    for x in range(width):
        p = img.get_pixel(x, y)

        # adjust the following to apply your image processing
        r = 0
        g = p.get_green()
        b = p.get_blue()

        new_pixel = image.Pixel(r, g, b)
        img.set_pixel(x, y, new_pixel)

    # unindent the following line to remove the "animation"
    img.draw(canvas)