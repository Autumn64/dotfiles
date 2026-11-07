#!/bin/env python3
import os
import tkinter as tk
from tkinter import ttk
from playsound3 import playsound
from ttkthemes import ThemedTk

"""
ATENCIÓN: Este script asume que se está usando systemd y x11. Se deben hacer adaptaciones en caso de usar un init system
o un servidor gráfico diferente.

Requiere: tkinter, ttk, ttkthemes, playsound3
"""

window = ThemedTk(theme="plastik", background=True)
window.title("Menú de apagado")
window.geometry('500x350')
window.resizable(False, False)

# Diccionario con las opciones disponibles y sus descripciones
sessionValues: dict = {
    "Cerrar sesión": {
        "command": ["loginctl", "terminate-session", os.environ.get("XDG_SESSION_ID"), "Xorg"],
        "desc": "Cierra todos los programas y finaliza la\nsesión. Se perderá todo el trabajo\nno guardado."
    },
    "Suspender": {
        "command": ["systemctl", "suspend"],
        "desc": "Hace que el equipo entre en estado\nde suspensión.\n"
    },
    "Hibernar": {
        "command": ["systemctl", "hibernate"],
        "desc": "Hace que el equipo entre en estado\nde hibernación.\n"
    },
    "Apagar": {
        "command": ["systemctl", "poweroff"],
        "desc": "Cierra todos los programas y apaga el\nequipo. Se perderá todo el trabajo \nno guardado."
    },
    "Reiniciar": {
        "command": ["systemctl", "reboot"],
        "desc": "Cierra todos los programas, apaga el\nequipo, y lo vuelve a encender. Se\nperderá todo el trabajo no guardado."
    }
}

def comboBoxChange(event) -> None:
# Callback que sólo cambia la label de descripción de acuerdo con la opción seleccionada
    infoLabel['text'] = sessionValues[comboBox.get()]["desc"]

def buttonClicked(button: str) -> None:
# Callback que revisa qué botón se presionó
    if button == "cancelButton":
    # Cierra la ventana y sale del programa
        window.destroy()
        os._exit(0)
    
    runAction(comboBox.get())

def runAction(action: str) -> None:
# Ejecuta la acción dependiendo de la opción seleccionada en el combo, también reproduce la música si es el caso
    command = sessionValues[action]["command"]
    window.destroy()
    if action in ["Cerrar sesión", "Apagar", "Reiniciar"]:
        playsound(f"{os.environ['HOME']}/GNUstep/Library/WindowMaker/Utils/Sounds/shutdown.mp3")
    os.execvp(command[0], command)

# Título y combo
ttk.Label(window, text="Escoja una opción...", font=("Helvetica", 14)).grid(column=0, row=0, columnspan=4, pady=50)
comboBox = ttk.Combobox(window)
comboBox['values'] = tuple(sessionValues.keys())
comboBox['state'] = "readonly"
comboBox.current(3)
comboBox.grid(column=0, row=1, columnspan=4, pady=5)
comboBox.bind("<<ComboboxSelected>>", comboBoxChange)

# Label de descripción
infoLabel = ttk.Label(window, text=sessionValues[comboBox.get()]["desc"])
infoLabel.grid(column=0, row=2, columnspan=4, pady=15)

# Botones
cancelButton = ttk.Button(window, text="Cancelar", command=lambda:buttonClicked("cancelButton")).grid(column=2, row=3, pady=30, padx=10, sticky=tk.E)
acceptButton = ttk.Button(window, text="Aceptar", command=lambda:buttonClicked("acceptButton")).grid(column=3, row=3, pady=30, padx=(0, 15), sticky=tk.W)

if __name__ == "__main__":
    # Configura las columnas del grid a que abarquen todo el ancho y levanta la ventana
    window.grid_columnconfigure(0, weight=1)
    window.grid_columnconfigure(1, weight=1)
    window.grid_columnconfigure(2, weight=1)
    # window.grid_columnconfigure(3, weight=1)
    window.mainloop()
