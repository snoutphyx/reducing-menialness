#Requires AutoHotkey >=2.0- <2.1
#SingleInstance
#Include %A_MyDocuments%\ahk\loaded.ahk
#Include %A_MyDocuments%\ahk\konzola.ahk
^e::Pause

WinActivate "ahk_exe" "chrome.exe"

broj_IB := InputBox("Broj: ", "TS")

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

WinActivate "ahk_exe" "chrome.exe"

A_ClipBoard := "document.getElementById('m1b0f03e2_bg_button_addrow-pb').click();"

konzola()

Send "TS`t`t"

Send "^!u"

Sleep 500

MsgBox("sad",, "4096")

A_ClipBoard := "
(
const table = document.evaluate(
    '//*[@id="CollapsiblePanel2"]/div[2]/table/tbody',
    document,
    null,
    XPathResult.FIRST_ORDERED_NODE_TYPE,
    null
`).singleNodeValue;

if (table) {
    let text = "";
    table.querySelectorAll("tr").forEach(row => {
        let rowText = [];
        row.querySelectorAll("td, th").forEach(cell => {
            rowText.push(cell.innerText.trim()); // Get text and trim spaces
        });
        text += rowText.join("\t") + "\n"; // Join with tabs and add a newline
    });

    // Copy to clipboard
    const textarea = document.createElement("textarea");
    textarea.value = text;
    document.body.appendChild(textarea);
    textarea.select();
    document.execCommand("copy");
    document.body.removeChild(textarea);

    console.log("Copied to clipboard!");
} else {
    console.log("Table not found!");
}
)"

konzola()

A_ClipBoard := RegExReplace(A_ClipBoard, "http.*ssh\s")
A_ClipBoard := RegExReplace(A_ClipBoard, "Opcije")

oprema := A_ClipBoard

Send "!m"

MsgBox("sad",, "4096")

Send broj 
Sleep 200
Send "`n"

MsgBox("sad",, "4096")

A_ClipBoard := "
(
const text = document.evaluate('/html/body/div[2]/div[3]/div/div[3]/div/div[3]/div/div/div/div/table/tbody/tr[2]/td/div/div/table/tbody/tr/td/table/tbody/tr[2]/td/table/tbody/tr/td[1]/table/tbody', 
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

konzola()

if ( RegExMatch(A_Clipboard, "User agent") )
	reg := 1
else
	reg := 0

Send "{F12}"

A_ClipBoard := "
(
document.getElementsByTagName('iframe')[2].contentDocument.querySelector('a[onclick="return showDescriptionForm(this);"]').click();
)"

Sleep 1000

Send "^v`n"

Sleep 500

A_ClipBoard := "
(
// Access the iframe
const iframe = document.getElementsByTagName('iframe')[2];
const iframeDocument = iframe.contentDocument;

// Get the MAC address from the link in the table cell with class "macAddress"
const macAddressElement = iframeDocument.querySelector('td.macAddress a');

if (macAddressElement) {
    const macAddress = macAddressElement.textContent.trim();
    
    // Copy to clipboard using the execCommand method
    const tempInput = document.createElement('input');
    document.body.appendChild(tempInput);
    tempInput.value = macAddress;
    tempInput.select();
    document.execCommand('copy');
    document.body.removeChild(tempInput);
    console.log('MAC address copied to clipboard:', macAddress);
`} else {
    console.error('MAC address element not found');
}
)"

Sleep 500

Send "^v`n"

Sleep 500

mac := A_ClipBoard

A_ClipBoard := "
(
// Access the iframe
const iframe = document.getElementsByTagName('iframe')[2];
const iframeDocument = iframe.contentDocument;

// Get the phone model from the title attribute of the model cell
const phoneModelElement = iframeDocument.querySelector('td#phoneModel');

if (phoneModelElement && phoneModelElement.hasAttribute('title')) {
    const phoneModel = phoneModelElement.getAttribute('title');
    
    // Copy to clipboard using the execCommand method
    const tempInput = document.createElement('input');
    document.body.appendChild(tempInput);
    tempInput.value = phoneModel;
    tempInput.select();
    document.execCommand('copy');
    document.body.removeChild(tempInput);
    console.log('Phone model copied to clipboard:', phoneModel);
`} else {
    console.error('Phone model element not found or has no title attribute');
}
)"

Sleep 500

Send "^v`n"

Sleep 500

model := A_ClipBoard

Send "{F12}"

Send "^+`t^+`t"

Sleep 500

A_ClipBoard := oprema ; jer inace posalje samo "IP adresa"
Sleep 500

Send "^v`n{Backspace}{Backspace}^{End}`n`n" ; ne pitaj zasto

Send "Linija:`n" broj "`nModel:`n" model "`nMAC:`n" mac "`nRegistracija: `n"

if (reg)
	Send "da"
else
	Send "ne"

Send "`nPort:`n"

ExitApp