import cv2
import tkinter as tk
from tkinter import filedialog, Canvas, Button, Label
from PIL import Image, ImageTk

# Variáveis globais
points = {}
current_frame = 0
cap = None
frame = None
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
    update_frame_label()  # Atualize o rótulo do frame
    show_frame()

def show_frame():
    global frame
    ret, frame = cap.read()
    if not ret:
        return
    frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
    image = Image.fromarray(frame)
    photo = ImageTk.PhotoImage(image=image)
    canvas.create_image(0, 0, image=photo, anchor=tk.NW)
    canvas.image = photo
    window.update()

def update_frame_label():
    frame_label.config(text=f"Frame: {current_frame}")

def click_event(event):
    global points, current_frame
    x, y = event.x, event.y
    if event.num == 1:
        if current_frame not in points:
            points[current_frame] = []
        points[current_frame].append((x, y))
        canvas.create_oval(x-5, y-5, x+5, y+5, fill='red')
    elif event.num == 3:
        if current_frame in points and (x, y) in points[current_frame]:
            points[current_frame].remove((x, y))
            canvas.create_oval(x-5, y-5, x+5, y+5, fill='black')

def key_event(event):
    if event.keysym == 'Right':
        next_frame()
    elif event.keysym == 'Left':
        prev_frame()

def next_frame():
    global current_frame
    current_frame += 1
    cap.set(cv2.CAP_PROP_POS_FRAMES, current_frame)
    update_frame_label()  # Atualize o rótulo do frame
    show_frame()

def prev_frame():
    global current_frame
    current_frame = max(0, current_frame - 1)
    cap.set(cv2.CAP_PROP_POS_FRAMES, current_frame)
    update_frame_label()  # Atualize o rótulo do frame
    show_frame()

def save_points():
    try:
        if not video_path or not cap:
            return
        total_frames = int(cap.get(cv2.CAP_PROP_FRAME_COUNT))
        output_filename = video_path.rsplit('.', 1)[0] + ".txt"
        with open(output_filename, 'w') as f:
            for frame_num in range(total_frames):
                if frame_num in points:
                    coordinates = ["{},{}".format(x, y) for x, y in points[frame_num]]
                    f.write("\t".join(coordinates) + "\n")
                else:
                    f.write("-9999,-9999\n")
        window.title("SantiagoMarker - Points saved successfully!")
    except Exception as e:
        window.title(f"SantiagoMarker - Error: {str(e)}")


window = tk.Tk()
window.title("PauloPRETOMarker")

# Adicione um rótulo no topo para exibir o número do frame
frame_label = Label(window, text=f"Frame: {current_frame}")
frame_label.pack(pady=10)

canvas = Canvas(window, bg="black")
canvas.pack(fill=tk.BOTH, expand=True)
canvas.bind("<Button-1>", click_event)
canvas.bind("<Button-3>", click_event)
window.bind("<Key>", key_event)

btn_load = Button(window, text="Load Video", command=load_video)
btn_load.pack(side=tk.LEFT, padx=10)

btn_prev = Button(window, text="<<", command=prev_frame)
btn_prev.pack(side=tk.LEFT)

btn_next = Button(window, text=">>", command=next_frame)
btn_next.pack(side=tk.LEFT)

btn_save = Button(window, text="Save Points", command=save_points)
btn_save.pack(side=tk.RIGHT, padx=10)

window.mainloop()
