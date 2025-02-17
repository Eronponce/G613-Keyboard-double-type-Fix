#Persistent ; Keeps the script running in the background
SetTitleMatchMode, 2 ; Allows partial window title matching

delay := 90 ; Defines the delay (in milliseconds) between allowed key presses
lastKeyPressTime := {} ; Stores the last key press time for each key

; Hotkeys for the specific keys: E, A, W, F (add yours)
$e::
$a::
$w::
$f::
    key := SubStr(A_ThisHotkey, 2) ; Extracts the pressed key from the hotkey
    current_time := A_TickCount ; Gets the current system tick count (time in milliseconds)

    ; Check if enough time has passed since the last key press
    if (!lastKeyPressTime[key] or (current_time - lastKeyPressTime[key] >= delay)) {
        lastKeyPressTime[key] := current_time ; Update last key press time

        ; Ensure Shift and Caps Lock work correctly for uppercase letters
        if (GetKeyState("CapsLock", "T") xor GetKeyState("Shift", "P")) {
            StringUpper, key, key ; Convert the key to uppercase
        }

        SendInput, %key% ; Send the processed key input to the system
    } else {
        ; Display a tooltip message if the key press is blocked due to rapid input
        Tooltip, Key %key% blocked!
        SetTimer, RemoveTooltip, 1000 ; Set a timer to remove the tooltip after 1 second
    }
return

RemoveTooltip:
    Tooltip ; Clears the tooltip
return
