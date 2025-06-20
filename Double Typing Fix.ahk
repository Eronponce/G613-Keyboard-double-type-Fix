#Requires AutoHotkey v2.0
SetTitleMatchMode(2)

delay := 90
lastKeyPressTime := Map()
global scriptEnabled := true
global keys := [
    "a","b","c","d","e","f","g","i","j","k","l","m",
    "n","o","p","q","r","s","t","u","v","w","x","y","z",
    "0","1","2","3","4","5","6","7","8","9",
    "-", "=", "[", "]", ";", "'", ",", ".", "/", "\\"
]

EnableHotkeys()

^h:: {
    global scriptEnabled
    scriptEnabled := !scriptEnabled

    if scriptEnabled {
        EnableHotkeys()
        ToolTip("🔵 Script ENABLED")
    } else {
        DisableHotkeys()
        ToolTip("🔴 Script DISABLED")
    }
    SetTimer(RemoveTooltip, -1500)
}

EnableHotkeys() {
    global keys
    for key in keys {
        Hotkey("$" key, CreateHandler(key), "On")
    }
}

DisableHotkeys() {
    global keys
    for key in keys {
        Hotkey("$" key, "Off")
    }
}

CreateHandler(k) {
    return (*) => HandleKey(k)
}

HandleKey(key) {
    global delay, lastKeyPressTime

    currentTime := A_TickCount
    lastTime := lastKeyPressTime.Has(key) ? lastKeyPressTime[key] : 0

    if (currentTime - lastTime >= delay) {
        lastKeyPressTime[key] := currentTime

        if (StrLen(key) = 1 && (GetKeyState("CapsLock", "T") != GetKeyState("Shift", "P"))) {
            key := StrUpper(key)
        }

        SendText(key)
    } else {
        ToolTip("⛔ Key '" key "' blocked")
        SetTimer(RemoveTooltip, -1000)
    }
}

RemoveTooltip(*) {
    ToolTip()
}
