import numpy as np
import matplotlib.pyplot as plt
from matplotlib.image import imread
import sys

img = imread(sys.argv[1])
imgplot = plt.imshow(img)
plt.title('Mouse.LEFT: mark | Mouse.RIGHT: unmark | Mouse.MIDDLE: stop')
cpix = plt.ginput(n=-1, timeout=0, show_clicks=True)
np.savetxt('coordpixelxy.csv', cpix, fmt='%d') 
