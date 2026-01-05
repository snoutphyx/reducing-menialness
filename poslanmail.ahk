#Requires AutoHotkey >=2.0- <2.1
#SingleInstance
#Include %A_MyDocuments%\ahk\konzola.ahk
^e::Pause

WinActivate "ahk_exe" "OUTLOOK.EXE"

Send "^r"
Sleep 500
Send "^a"
Sleep 500
Send "^c"
Sleep 500
Send "{Esc}"
Sleep 500
Send "{Esc}"
Sleep 500

mail := A_ClipBoard

WinActivate "ahk_exe" "chrome.exe"


A_ClipBoard := "document.getElementById('m1b0f03e2_bg_button_addrow-pb').click();"

konzola()

Sleep 1000
Send "`t`t"

Sleep 1000

A_ClipBoard := mail

Send "^v"
Send "^{Home}"
Sleep 200
Send "{Del}{Del}"
Sleep 500
Send "+`t+`t"

ExitApp