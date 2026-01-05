#Requires AutoHotkey >=2.0- <2.1
#SingleInstance
#Include %A_MyDocuments%\ahk\konzola.ahk
^e::Pause

A_ClipBoard := "document.getElementById('mc52210ec_bg_button_addrow-pb').click();"

konzola()

Sleep 1000
Send "0"
Sleep 500
Send "{Down}"
Sleep 500
Send "`n"
Sleep 1000
Send "`tDolazak u periodu`t"
Sleep 1000
Send "+`t+`t"
start := A_Now
if ( SubStr(A_Now, 11, 2) < 30 )
	start := SubStr(start, 1, 8) A_Hour + 1 "3000"
else
	start := SubStr(start, 1, 8) A_Hour + 2 "0000"
Send FormatTime(start, "dd.MM.yy HH:mm:ss")
Sleep 1000
end := SubStr(start, 1, 8) A_Hour + 4 SubStr(start, 11, 1) "000"
Send "`t" FormatTime(end, "dd.MM.yy HH:mm:ss")
Sleep 1000
Send "`tRegija Zagreb"
Sleep 500
Send "`tMetronet Zagreb"
Sleep 500
Send " – interno"
Sleep 500
Send "`tIntervencija"
Sleep 500
Send "`t"
Sleep 500
Send "*phone*"
Sleep 500
Send "`t"
Sleep 500
Send "-"
Sleep 500
Send "`t`t`t"
Sleep 500
Send "`n"
Sleep 500
Send "`t`t"
Sleep 1000
Send "Optička infrastruktura`t"
Sleep 1000


ExitApp
