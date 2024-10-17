import pyautogui
import os
from PIL import Image, ImageFilter
import time

start = time.time()
im0 = pyautogui.screenshot()
end = time.time()
print("time for screenshot", end - start)

start = time.time()
im1 = im0.filter(ImageFilter.BoxBlur(10))
end = time.time()
print("time for image filter", end - start)

start = time.time()
im1.save('/tmp/scls.png')
end = time.time()
print("time for saving image", end - start)

os.popen('i3lock -i /tmp/scls.png')
