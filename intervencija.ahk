#Requires AutoHotkey >=2.0- <2.1
#SingleInstance
^e::Pause

Run A_MyDocuments "\RADNI NALOZI\Nalog.docx"

WinWait "Nalog.docx - Word"
WinActivate "Nalog.docx - Word"

WinActivate "ahk_exe" "chrome.exe"

Send "{F12}"

A_ClipBoard := "
(
const element = document.evaluate(
    '//*[@id="mb1527970-tb"]', 
    document, 
    null, 
    XPathResult.FIRST_ORDERED_NODE_TYPE, 
    null
`).singleNodeValue;

const text = element?.value.trim() || '';

if (text) {
    const textarea = document.createElement('textarea');
    textarea.value = text;
    document.body.appendChild(textarea);
    textarea.select();
    document.execCommand('copy');
    document.body.removeChild(textarea);
    console.log('Copied to clipboard:', text);
} else {
    console.log('No text found at the specified XPath.');
}
)"

Sleep 1000

Send "^v`n"

Sleep 500

korisnik := A_ClipBoard

A_ClipBoard := "
(
const element = document.evaluate(
    '//*[@id="mad5af16c-tb2"]', 
    document, 
    null, 
    XPathResult.FIRST_ORDERED_NODE_TYPE, 
    null
`).singleNodeValue;

const text = element?.value.trim() || '';

if (text) {
    const textarea = document.createElement('textarea');
    textarea.value = text;
    document.body.appendChild(textarea);
    textarea.select();
    document.execCommand('copy');
    document.body.removeChild(textarea);
    console.log('Copied to clipboard:', text);
} else {
    console.log('No text found at the specified XPath.');
}
)"

Sleep 500

Send "^v`n"

Sleep 500

adresa := A_ClipBoard
ulica := RegExReplace(adresa, ",.*")
mjesto := RegExReplace(adresa, ".*\d\s")

A_Clipboard := "
(
const text = document.evaluate(
    '//*[@id="m77a6936f-lb"]', 
    document, 
    null, 
    XPathResult.FIRST_ORDERED_NODE_TYPE, 
    null
`).singleNodeValue?.textContent.trim() || '';

if (text) {
    const textarea = document.createElement('textarea');
    textarea.value = text;
    document.body.appendChild(textarea);
    textarea.select();
    document.execCommand('copy');
    document.body.removeChild(textarea);
    console.log('Copied to clipboard:', text);
} else {
    console.log('No text found at the specified XPath.');
}
)"

Sleep 500

Send "^v`n"

Sleep 500

inc := A_ClipBoard

Send "{F12}"

Sleep 500

broj_IB := InputBox("Kontakt broj: ", "Podaci")

broj := StrReplace(broj_IB.value, " ")
broj := StrReplace(broj, "/")
broj := StrReplace(broj, "-")
broj := StrReplace(broj, "+")

if ( SubStr(broj, 1, 3) = 385 )
	broj := "0" SubStr(broj, 4, StrLen(broj) - 1)

if broj_IB.Result = "Cancel" {

	MsgBox "Pausing the script"
	Pause
	
}

regija_IB := InputBox("Regija(s, i, j, z, zd, og, gs): ", "Podaci")

regija := regija_IB.value

if regija_IB.Result = "Cancel" {

	MsgBox "Pausing the script"
	Pause
	
}

WinActivate "Nalog.docx - Word"

; full screen
Send "!{Space}x"

; ispunjava nalog
Send "{Down}{Down}`t" korisnik "{Down}" ulica "{Down}" mjesto "{Down}{Down}{Down}" broj

; sprema nalog
Send "{F12}"
Sleep 1000

adresa_cista := StrReplace(adresa, "/", "-")
adresa_cista := StrReplace(adresa_cista, "`"", "")
Sleep 500
Send korisnik " " adresa_cista " " inc "`n"
Sleep 1500

; prilaze i otvara mail
Send "!fzea"

; ispunjava mail
WinWaitActive(korisnik " " StrReplace(adresa, "/", "-") " " inc ".docx - Message (HTML) ")

; full screen
Send "!{Space}x"

if ( regija = "s" or regija = "i" ) {

	Send "Enterprise Delivery Team North East"

} else if ( regija = "j" ) {

	Send "Tehnika-jug"

} else if ( regija = "zd" ) {

	Send "Tehnika-jug`nservice`nfg"

} else if ( regija = "z" ) {

	Send "Tehnika-zapad"
	
} else if ( regija = "og" ) {

	Send "Tehnika-zapad`nkokek`nfg"
	
} else if ( regija = "gs" ) {

	Send "Tehnika-zapad`ntimber`nfg"

} else {

	MsgBox "Error. Pausing the script."
	Pause

}

Send "`n`tsmc_kvar`n`t{End}^{Backspace}{Backspace}"

; ispunjava body maila
Send "`t`tPozdrav,`n`n`n`nKB:`n" broj "`nRadno vrijeme:`n`nMikrolokacija:`n"

ExitApp