"""
paulopretoangle.py

Este programa permite ao usuário carregar um vídeo e calcular ângulos entre dois pares de pontos selecionados em cada frame.
O usuário pode navegar frame a frame e selecionar pontos clicando no vídeo. Os ângulos calculados são salvos em um arquivo de texto.

Instruções de Uso:
1. Execute o programa.
2. Clique no botão "Load Video" para carregar um vídeo.
3. Use os botões "<<" e ">>" para navegar entre os frames.
4. Clique no vídeo para selecionar os pontos. O primeiro ponto de cada par será marcado com um círculo verde e o segundo com um quadrado vermelho.
5. Após selecionar dois pares de pontos, o ângulo entre eles será calculado e salvo no arquivo.
6. Continue navegando pelos frames e selecionando pontos conforme necessário.

Autor: Paulo Roberto Pereira Santiago
Data: 27 de Setembro de 2023
"""

import cv2
import os
import tkinter as tk
from tkinter import filedialog, Canvas, Button, Label, Frame
from PIL import Image, ImageTk
from math import acos, degrees

# Variáveis globais
points = []  # Lista para armazenar pontos selecionados
lines = []  # Lista para armazenar linhas formadas pelos pontos
current_frame = 0  # Frame atual sendo exibido
cap = None  # Objeto de captura de vídeo
video_path = ""  # Caminho do vídeo carregado

def load_video():
    """Carrega um vídeo e ajusta o tamanho do canvas para corresponder às dimensões do vídeo."""
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
    """Exibe o frame atual e atualiza o label com o número do frame."""
    global cap, current_frame
    cap.set(cv2.CAP_PROP_POS_FRAMES, current_frame)
    ret, frame = cap.read()
    if not ret:
        return
    frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)

    # Obter as dimensões originais do vídeo
    original_width = frame.shape[1]
    original_height = frame.shape[0]

    # Definir um tamanho máximo para exibição
    max_display_width = 1000
    max_display_height = 600

    # Calcular a proporção de redimensionamento
    width_ratio = max_display_width / original_width
    height_ratio = max_display_height / original_height
    resize_ratio = min(width_ratio, height_ratio)

    # Redimensionar o frame, se necessário
    if resize_ratio < 1:
        frame = cv2.resize(frame, (int(original_width * resize_ratio), int(original_height * resize_ratio)))

    # Ajustar o tamanho do canvas para corresponder às dimensões redimensionadas do vídeo
    canvas.config(width=int(original_width * resize_ratio), height=int(original_height * resize_ratio))

    image = Image.fromarray(frame)
    photo = ImageTk.PhotoImage(image=image)

    # Exibir o vídeo no canvas
    canvas.create_image(0, 0, image=photo, anchor=tk.NW)
    canvas.image = photo
    frame_label.config(text=f"Frame: {current_frame}")
    window.update()

def next_frame():
    """Avança para o próximo frame."""
    global current_frame
    current_frame += 1
    show_frame()

def prev_frame():
    """Retorna ao frame anterior."""
    global current_frame
    current_frame = max(0, current_frame - 1)
    show_frame()

def click_event(event):
    """Manipula o evento de clique no canvas, selecionando pontos e calculando ângulos."""
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
    """Calcula o ângulo entre dois pares de pontos."""
    vec1 = (lines[0][1][0] - lines[0][0][0], lines[0][1][1] - lines[0][0][1])
    vec2 = (lines[1][1][0] - lines[1][0][0], lines[1][1][1] - lines[1][0][1])
    dot_product = vec1[0] * vec2[0] + vec1[1] * vec2[1]
    mag1 = (vec1[0]**2 + vec1[1]**2)**0.5
    mag2 = (vec2[0]**2 + vec2[1]**2)**0.5
    cos_theta = dot_product / (mag1 * mag2)
    angle = degrees(acos(cos_theta))
    return angle

def save_data(angle):
    """Salva os dados do ângulo no arquivo de saída."""
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

canvas = Canvas(window, bg="black", width=600, height=400)
canvas.pack(pady=20)
canvas.bind("<Button-1>", click_event)

frame_label = Label(window, text=f"Frame: {current_frame}")
frame_label.pack(pady=10)

btn_frame = tk.Frame(window)
btn_frame.pack(pady=20)

btn_load = Button(btn_frame, text="Load Video", command=load_video)
btn_load.pack(side=tk.LEFT, padx=10)

btn_prev = Button(btn_frame, text="<<", command=prev_frame)
btn_prev.pack(side=tk.LEFT, padx=10)

btn_next = Button(btn_frame, text=">>", command=next_frame)
btn_next.pack(side=tk.LEFT, padx=10)

window.mainloop()
