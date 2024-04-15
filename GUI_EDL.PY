# import serial
# port = "COM5"
# ser = serial.Serial(port, 115200, timeout = 0)
# ser.write("A".encode('Ascii'))
# receive =  ser.read()
# print(receive.decode('utf-8'))

# import serial
# import matplotlib.pyplot as plt

# # Configure the serial port
# port = "COM5"  # Change this to the appropriate port for your system
# baud_rate = 115200  # Ensure this matches the baud rate used in your STM32 code

# # Open the serial port
# ser = serial.Serial(port, baud_rate, timeout=1)

# # Function to send a command and read the responses
# def send_command(command):
#     ser.write(command.encode('Ascii'))  # Send the command
#     ser.flush()  # Flush the output buffer
#     responses = []
#     while True:
#         response = ser.readline().decode('utf-8').strip()
#         if not response:
#             break
#         responses.append(response)
#         #print(response)

#     return responses
# SCALE_FACTOR = 3.3 * 5.54 / 4096  # Adjust this value if needed
# REF_CAP_Value = 0.0000001
# Offset_Val = 5.56
# # Send commands to generate waveforms
# while True:
#     command = input("Enter a command ('A', 'B', 'C', or 'D', or 'q' to quit): ").upper()
#     if command == 'Q':
#         break
#     elif command in ['A', 'B', 'C', 'D']:
#         responses = send_command(command)
#         V1 = [int(responses[i]) * 4 - 10 for i in range(0, len(responses), 2)]
#         V2 = [int(responses[i]) * SCALE_FACTOR + Offset_Val for i in range(1, len(responses), 2)]
#         Q = [V2[i] * REF_CAP_Value for i in range(len(V2))]
#         V_Test = [V1[i] - V2[i] for i in range(len(V1))]
#                 # Plot the graph
#         plt.plot(V_Test, Q)
#         plt.xlabel('V_test')
#         plt.ylabel('Q')
#         plt.title('Q vs V_Test')
#         plt.show()
#     else:
#         print("Invalid command. Please try again.")

# Close the serial port
# ser.close()

# def StringChallenge(sen):

#   # code goes here
#   varOcg = [word.strip('.,!?') for word in sen.split() if word.isalnum()]

#   longest_word =''
#   longest_length = 0

#   for word in varOcg:
#     length = len(word)

#     if length > longest_length:
#       longest_word = word
#       longest_length = length

#   letters_set = set("uncfqy9ta8b")
#   filtered_word =  ''.join(filter(lambda c: c not in letters_set, longest_word))
#   return filtered_word

# print(StringChallenge("fune tim!!ee"))


import serial
import matplotlib
matplotlib.use('TkAgg')
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
import matplotlib.pyplot as plt
import tkinter as tk
import numpy as np
from scipy import signal

# Configure the serial port
port = "COM3"  # Change this to the appropriate port for your system
baud_rate = 115200  # Ensure this matches the baud rate used in your STM32 code

# Open the serial port
ser = serial.Serial(port, baud_rate, timeout=1)

# Function to send a command and read the responses
def send_command(command):
    ser.write(command.encode('Ascii'))  # Send the command
    ser.flush()  # Flush the output buffer
    responses = []
    while True:
        response = ser.readline().decode('utf-8').strip()
        if not response:
            break
        responses.append(response)
    return responses

# Function to plot the graph
def plot_graph():
    responses = send_command(selected_command.get())
    V_DAC = [int(responses[i]) * float(scale_factor.get())*5 for i in range(0, len(responses), 2)]
    T = np.arange(len(V_DAC))
    V1 = [int(responses[i]) * 4 * float(scale_factor.get())*5 - 10 for i in range(0, len(responses), 2)]
    V2 = [(4096 - int(responses[i])) * float(scale_factor.get()) + float(offset_val.get())*3.3 for i in range(1, len(responses), 2)]
    Q = [V2[i] * float(ref_cap_value.get()) for i in range(len(V2))]
    V_Test = [V1[i] for i in range(len(V1))]
    print(responses)
    C = [abs(Q[i] / V_Test[i]) for i in range(len(Q))]
    print(sum(C)/len(C))
    # print(responses)
    # Clear the previous plot
    ax.clear()

    # Plot the new graphs
    ax1 = fig.add_subplot(211)
    ax1.plot(T, V_DAC)
    ax1.set_xlabel('V_DAC')
    
    ax1.set_ylabel('T')
    ax1.set_title('V_DAC vs T')

    ax2 = fig.add_subplot(212)
    ax2.plot(V_Test, Q)
    ax2.set_xlabel('V_test')
    ax2.set_ylabel('Q')
    ax2.set_title('Q vs V_Test')

    # Draw canvas
    canvas.draw()

# Create the main window
root = tk.Tk()
root.title("Waveform Generator")
root.geometry("800x800")  # Set the window size

# Create a frame for the buttons
button_frame = tk.Frame(root)
button_frame.pack(side=tk.TOP, pady=10)

# Create buttons for generating waveforms
selected_command = tk.StringVar()
selected_command.set('A')
tk.Radiobutton(button_frame, text="Case A", variable=selected_command, value='A').pack(side=tk.LEFT, padx=5)
tk.Radiobutton(button_frame, text="Case B", variable=selected_command, value='B').pack(side=tk.LEFT, padx=5)
tk.Radiobutton(button_frame, text="Case C", variable=selected_command, value='C').pack(side=tk.LEFT, padx=5)
tk.Button(button_frame, text="Generate", command=plot_graph).pack(side=tk.LEFT, padx=5)
tk.Button(button_frame, text="Quit", command=root.quit).pack(side=tk.LEFT, padx=5)

# Create a frame for the text boxes
text_frame = tk.Frame(root)
text_frame.pack(side=tk.TOP, pady=10)

# Create text boxes for changing values
scale_factor = tk.StringVar(value="0.000244140625")
tk.Label(text_frame, text="Scale Factor:").pack(side=tk.LEFT, padx=5)
tk.Entry(text_frame, textvariable=scale_factor).pack(side=tk.LEFT, padx=5)

ref_cap_value = tk.StringVar(value="0.000000000011")
tk.Label(text_frame, text="REF_CAP_Value:").pack(side=tk.LEFT, padx=5)
tk.Entry(text_frame, textvariable=ref_cap_value).pack(side=tk.LEFT, padx=5)

offset_val = tk.StringVar(value="5.54")
tk.Label(text_frame, text="Offset_Val:").pack(side=tk.LEFT, padx=5)
tk.Entry(text_frame, textvariable=offset_val).pack(side=tk.LEFT, padx=5)

# Create a frame for the plot
plot_frame = tk.Frame(root)
plot_frame.pack(side=tk.TOP, pady=10)

# Create the plot
fig, ax = plt.subplots(figsize=(8, 8))  # Increase the figure size
canvas = FigureCanvasTkAgg(fig, master=plot_frame)
canvas.draw()
canvas.get_tk_widget().pack()

# Start the main event loop
root.mainloop()

# Close the serial port
ser.close()

