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
    
    # Obter as dimensões originais do vídeo
    original_width = frame.shape[1]
    original_height = frame.shape[0]

    # Obter as dimensões da tela
    screen_width = window.winfo_screenwidth()
    screen_height = window.winfo_screenheight()

    # Calcular a proporção de redimensionamento
    width_ratio = screen_width / original_width
    height_ratio = screen_height / original_height
    resize_ratio = min(width_ratio, height_ratio)

    # Redimensionar o frame para que ele se ajuste à tela, mantendo a proporção
    frame = cv2.resize(frame, (int(original_width * resize_ratio), int(original_height * resize_ratio)))

    image = Image.fromarray(frame)
    photo = ImageTk.PhotoImage(image=image)
    canvas.config(width=screen_width, height=screen_height)  # Ajusta o tamanho do canvas para o tamanho da tela
    canvas.create_image(0, 0, image=photo, anchor=tk.NW)
    canvas.image = photo
    frame_label.config(text=f"Frame: {current_frame}")
    window.update()

window = tk.Tk()
window.title("Angle Calculator in Video")
window.geometry(f"{window.winfo_screenwidth()}x{window.winfo_screenheight()}")  # Define o tamanho da janela para o tamanho da tela

canvas = Canvas(window, bg="black")
canvas.pack(fill=tk.BOTH, expand=True)
canvas.bind("<Button-1>", click_event)

frame_label = Label(window, text=f"Frame: {current_frame}")
frame_label.pack(pady=10)

btn_frame = Frame(window)
btn_frame.pack(pady=20)

btn_load = Button(btn_frame, text="Load Video", command=load_video)
btn_load.pack(side=tk.LEFT, padx=10)

btn_prev = Button(btn_frame, text="<<", command=prev_frame)
btn_prev.pack(side=tk.LEFT, padx=10)

btn_next = Button(btn_frame, text=">>", command=next_frame)
btn_next.pack(side=tk.LEFT, padx=10)

window.mainloop()
