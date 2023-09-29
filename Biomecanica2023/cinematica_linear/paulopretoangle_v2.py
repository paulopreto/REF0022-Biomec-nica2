import cv2
import os
import tkinter as tk
from tkinter import filedialog, Canvas, Button, Label, Frame, Scrollbar
from PIL import Image, ImageTk
from math import acos, degrees

# Variáveis globais
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
    frame_label.config(text=f"Frame: {current_frame}")
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
    if len(points) == 1:
        canvas.create_oval(x-3, y-3, x+3, y+3, fill='green', tags="marker")
    elif len(points) == 2:
        canvas.create_rectangle(x-3, y-3, x+3, y+3, fill='red', tags="marker")
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
    output_filename = video_path.rsplit('.', 1)[0] + "_final_angle.txt"
    add_header = not os.path.exists(output_filename)
    with open(output_filename, 'a') as f:
        if add_header:
            f.write("Frame,Point1_x,Point1_y,Point2_x,Point2_y,Point3_x,Point3_y,Point4_x,Point4_y,Angle_degrees\n")
        line_data = f"{current_frame},{lines[0][0][0]},{lines[0][0][1]},{lines[0][1][0]},{lines[0][1][1]},{lines[1][0][0]},{lines[1][0][1]},{lines[1][1][0]},{lines[1][1][1]},{angle:.2f}"
        f.write(line_data + '\n')

window = tk.Tk()
window.title("Angle Calculator in Video")

main_frame = Frame(window)
main_frame.pack(fill=tk.BOTH, expand=1)

canvas_frame = Frame(main_frame)
canvas_frame.pack(side=tk.LEFT)

canvas = Canvas(canvas_frame, bg="black", width=600, height=400)
canvas.pack(side=tk.LEFT, pady=20, padx=10)
canvas.bind("<Button-1>", click_event)

scrollbar = Scrollbar(canvas_frame, orient=tk.VERTICAL, command=canvas.yview)
scrollbar.pack(side=tk.RIGHT, fill=tk.Y)
canvas.config(yscrollcommand=scrollbar.set)

frame_label = Label(main_frame, text=f"Frame: {current_frame}")
frame_label.pack(pady=10)

btn_frame = Frame(main_frame)
btn_frame.pack(side=tk.LEFT, padx=10)

btn_load = Button(btn_frame, text="Load Video", command=load_video)
btn_load.pack(pady=10)

btn_prev = Button(btn_frame, text="<<", command=prev_frame)
btn_prev.pack(pady=10)

btn_next = Button(btn_frame, text=">>", command=next_frame)
btn_next.pack(pady=10)

window.mainloop()
