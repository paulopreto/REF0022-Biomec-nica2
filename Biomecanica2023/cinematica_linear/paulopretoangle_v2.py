import cv2
import os
import tkinter as tk
from tkinter import filedialog, Canvas, Button, Label, Frame
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
    
    # Obter as dimensões da tela
    screen_width = window.winfo_screenwidth()
    screen_height = window.winfo_screenheight()

    # Calcular a proporção de redimensionamento
    original_width = frame.shape[1]
    original_height = frame.shape[0]
    width_ratio = screen_width / original_width
    height_ratio = screen_height / original_height
    resize_ratio = min(width_ratio, height_ratio)

    # Redimensionar o frame
    frame = cv2.resize(frame, (int(original_width * resize_ratio), int(original_height * resize_ratio)))

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

# (resto do seu código para calcular ângulos, salvar dados, etc.)

window = tk.Tk()
window.title("Angle Calculator in Video")

main_frame = Frame(window)
main_frame.pack(fill=tk.BOTH, expand=1)

canvas_frame = Frame(main_frame)
canvas_frame.pack(side=tk.LEFT)

canvas = Canvas(canvas_frame, bg="black", width=600, height=400)
canvas.pack(side=tk.LEFT, pady=20, padx=10)
canvas.bind("<Button-1>", click_event)

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
