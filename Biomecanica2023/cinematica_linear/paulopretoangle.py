import cv2
import tkinter as tk
from tkinter import filedialog, Canvas, Button, Label
from PIL import Image, ImageTk
from math import acos, degrees

# Global variables
points = []
lines = []
current_frame = 0
cap = None
video_path = ""

def load_video():
    global cap, current_frame, video_path
    filepath = filedialog.askopenfilename(filetypes=[("All supported files", ("*.mp4", "*.mov", "*.avi")),
                                                     ("MP4 files", "*.mp4"),
                                                     ("MOV files", "*.mov"),
                                                     ("AVI files", "*.avi")])
    if not filepath:
        return
    video_path = filepath
    cap = cv2.VideoCapture(filepath)
    current_frame = 0
    show_frame()

def show_frame():
    global cap, current_frame
    cap.set(cv2.CAP_PROP_POS_FRAMES, current_frame)
    ret, frame = cap.read()
    if not ret:
        return
    frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
    image = Image.fromarray(frame)
    photo = ImageTk.PhotoImage(image=image)
    canvas.create_image(0, 0, image=photo, anchor=tk.NW)
    canvas.image = photo
    window.update()

def next_frame():
    global current_frame
    current_frame += 1
    show_frame()

def prev_frame():
    global current_frame
    current_frame = max(0, current_frame - 1)
    show_frame()

def click_event(event):
    global points, lines, current_frame
    x, y = event.x, event.y
    points.append((x, y))
    canvas.create_oval(x-3, y-3, x+3, y+3, fill='red', tags="marker")
    if len(points) == 2:
        canvas.create_line(points, fill='blue', tags="marker")
        lines.append(points)
        points = []
    if len(lines) == 2:
        angle = calculate_angle()
        save_data(angle)
        lines.clear()

def calculate_angle():
    vec1 = (lines[0][1][0] - lines[0][0][0], lines[0][1][1] - lines[0][0][1])
    vec2 = (lines[1][1][0] - lines[1][0][0], lines[1][1][1] - lines[1][0][1])
    dot_product = vec1[0] * vec2[0] + vec1[1] * vec2[1]
    mag1 = (vec1[0]**2 + vec1[1]**2)**0.5
    mag2 = (vec2[0]**2 + vec2[1]**2)**0.5
    cos_theta = dot_product / (mag1 * mag2)
    angle = degrees(acos(cos_theta))
    return angle

def save_data(angle):
    global current_frame, video_path
    output_filename = video_path.rsplit('.', 1)[0] + "_angles.txt"
    with open(output_filename, 'a') as f:
        line_data = [f"Frame: {current_frame}", f"Angle: {angle:.2f} degrees"]
        for line in lines:
            line_data.append(f"Points: {line[0]} to {line[1]}")
        f.write('\n'.join(line_data) + '\n\n')

window = tk.Tk()
window.title("Angle Calculator in Video")

canvas = Canvas(window, bg="black", width=600, height=400)
canvas.pack(pady=20)
canvas.bind("<Button-1>", click_event)

btn_load = Button(window, text="Load Video", command=load_video)
btn_load.pack(side=tk.LEFT, padx=10)

btn_prev = Button(window, text="<<", command=prev_frame)
btn_prev.pack(side=tk.LEFT, padx=10)

btn_next = Button(window, text=">>", command=next_frame)
btn_next.pack(side=tk.LEFT, padx=10)

window.mainloop()
