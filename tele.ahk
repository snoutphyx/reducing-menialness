#Requires AutoHotkey >=2.0- <2.1
#SingleInstance
#Include %A_MyDocuments%\ahk\konzola.ahk
^e::Pause

Send "{F12}"

A_ClipBoard := "
(
const text = document.evaluate('/html/body/div[2]/div[3]/div/div[3]/div/div[3]/div/div/div/div/table/tbody/tr[1]/td/table/tbody/tr[1]/td/table/tbody/tr/td[1]/div/table/tbody/tr/td[1]/div', 
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

Sleep 1000

Send "^v`n"

Sleep 500

A_ClipBoard := RegExReplace(A_ClipBoard, "Subscriber ")
A_ClipBoard := RegExReplace(A_ClipBoard, " .*$")

broj := A_ClipBoard

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

if ( RegExMatch(A_Clipboard, "User agent") )
	reg := 1
else
	reg := 0

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

Sleep 1000

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

Sleep 1000

Send "^v`n"

Sleep 500

model := A_ClipBoard

A_ClipBoard := "
(
setTimeout(() => {
  // Find the iframe
  const iframe = document.getElementsByTagName('iframe')[2]; // Adjust index as needed
  
  // Extract the parentId
  const parentId = iframe.getAttribute('parentid');
  console.log("Parent ID:", parentId);
  
  // Try to directly call the closeIframe function
  if (typeof closeIframe === 'function') {
    console.log("Calling closeIframe directly");
    closeIframe('false', null, parentId);
  } else if (parent && typeof parent.closeIframe === 'function') {
    console.log("Calling parent.closeIframe");
    parent.closeIframe('false', null, parentId);
  } else {
    console.log("closeIframe function not found");
  }
}, 1000);
)"
Send "^v`n"

Sleep 1000

Send "{F12}"

Sleep 500

A_ClipBoard := ""
A_ClipBoard := "Linija:`n"
A_ClipBoard .= broj
A_ClipBoard .= "`nModel:`n"
A_ClipBoard .= model
A_ClipBoard .= "`nMAC:`n"
A_ClipBoard .= mac
A_ClipBoard .= "`nRegistracija:`n"
if (reg)
	A_ClipBoard .= "da"
else
	A_ClipBoard .= "ne"
A_ClipBoard .= "`nPort:`n"

ExitApp