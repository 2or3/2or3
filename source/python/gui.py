import PySimpleGUI as sg

sg.theme('DarkAmber')

layout = [  [sg.Text("title")],
            [sg.Text("body: Please input something text"), sg.InputText()],
            [sg.Button('OK'), sg.Button('Cancel')] ]

window = sg.Window('test', layout)

while True:
    event, values = window.read()
    if event == sg.WIN_CLOSED or event == 'Cancel':
        break
    elif event == 'OK':
        print('your input: ', values[0])

window.close()

