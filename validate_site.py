import requests
import time
import tkinter as tk
from tkinter import messagebox

# URL do site que você deseja monitorar
url = 'http://www.fantasia.com'

def check_website(url):
    try:
        response = requests.get(url, timeout=10)
        # Verifica se o status code é 200 (OK)
        if response.status_code == 200:
            print(f"{time.ctime()}: {url} está OK")
            show_success_popup(url)
            return True
        else:
            print(f"{time.ctime()}: {url} não está OK - Status Code: {response.status_code}")
            show_error_popup(url)
            return False
    except requests.exceptions.RequestException:
        print(f"{time.ctime()}: {url} não está OK - Erro na comunicação")
        show_error_popup(url)
        return False

def show_success_popup(url):
    root = tk.Tk()
    root.withdraw()  # Esconde a janela principal do Tkinter
    messagebox.showinfo("Site OK", f"O site {url} está comunicando corretamente.")
    root.destroy()

def show_error_popup(url):
    root = tk.Tk()
    root.withdraw()  # Esconde a janela principal do Tkinter
    messagebox.showerror("Erro no Site", f"O site {url} não está comunicando.")
    root.destroy()

while True:
    check_website(url)
    # Espera 15 minutos (900 segundos) antes de checar novamente
    time.sleep(2)
