#Requires AutoHotkey >=2.0- <2.1
#SingleInstance
^e::Pause

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

Sleep 1500

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

A_ClipBoard := korisnik " " adresa " " inc

Sleep 500

ExitApp