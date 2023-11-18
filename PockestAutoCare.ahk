#Requires AutoHotkey v2.0
#SingleInstance

ConfigFile := "./PockestAutoCare.ini"

; read config file - Settings
WindowTitle := IniRead(ConfigFile, "Settings", "WindowTitle", "Pockest | Buckler's Boot Camp | STREET FIGHTER 6 | CAPCOM")
Size := IniRead(ConfigFile, "Settings", "Size", 302)
CanvasX := IniRead(ConfigFile, "Settings", "CanvasX", 333)
CanvasY := IniRead(ConfigFile, "Settings", "CanvasY", 443)
RefreshDelay := IniRead(ConfigFile, "Settings", "RefreshDelay", 1800000)

; read config file - CarePlan
CareDelay := IniRead(ConfigFile, "CarePlan", "CareDelay", 60000)
Feed := IniRead(ConfigFile, "CarePlan", "Feed", "False") = "True"
Cure := IniRead(ConfigFile, "CarePlan", "Cure", "False") = "True"
Clean := IniRead(ConfigFile, "CarePlan", "Clean", "False") = "True"
Train := IniRead(ConfigFile, "CarePlan", "Train", "False") = "True"
TrainStat := IniRead(ConfigFile, "CarePlan", "TrainStat", "Power")
TrainStatDict := Map()
TrainStatDict["Power"] := 0
TrainStatDict["Speed"] := 1
TrainStatDict["Technique"] := 2
TrainStatIndex := TrainStatDict[TrainStat]

ResetWindow() {
    WinWait WindowTitle
    WinActivate WindowTitle
    WinRestore WindowTitle
    WinMove 0, 0, 1000, 1000, WindowTitle
}

ReloadWindow() {
    Send "{F5}"
}

ClickCareButton(index) {
    ResetWindow()
    MouseClick "left", CanvasX + (Size / 2) + ((index - 1) * 80), CanvasY + 30
}

ClickBottomButton(index) {
    ResetWindow()
    MouseClick "left", CanvasX + ((Size / 4) + 0.5) * index, CanvasY + Size - 30
}

SelectTrainingType(index) {
    ResetWindow()
    MouseClick "left", CanvasX + (Size / 3) * (index + 0.5), CanvasY + (Size / 2)
}

ClickContinue() {
    ResetWindow()
    MouseClick "left", CanvasX + (Size / 2), CanvasY + Size - 70
}

ClickClose() {
    ResetWindow()
    MouseClick "left", CanvasX + Size - 10, CanvasY + Size - 10
}

MenuStatusReset() {
    ClickBottomButton(2)
    Sleep 100
    ClickClose()
}

CareLoop() {
    Static pockestLoopCount := 0
    if (Mod(pockestLoopCount, RefreshDelay / CareDelay) = 0) {
        ReloadWindow()
        Sleep 3000
    }

    ; In case of evolution
    ClickContinue()
    Sleep 500

    ; Care (feed)
    if (Feed) {
        ClickCareButton(0)
        MenuStatusReset()
        Sleep 100
    }

    ; ; Care (cure)
    if (Cure) {
        ClickCareButton(1)
        MenuStatusReset()
        Sleep 100
    }

    ; Care (clean)
    if (Clean) {
        ClickCareButton(2)
        MenuStatusReset()
        Sleep 100
    }

    ; Train
    if (Train) {
        ClickBottomButton(1)
        Sleep 100
        SelectTrainingType(TrainStatIndex)
        Sleep 1500
        ClickContinue()
        Sleep 500
        ClickClose()
    }

    pockestLoopCount := pockestLoopCount + 1
}

+F12:: {
    Static on := False
    If (on := !on) {
        SetTimer(CareLoop, CareDelay), SoundBeep(1500), CareLoop()
    } Else {
        SetTimer(CareLoop, 0), SoundBeep(1000)
    }
}
