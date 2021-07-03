; ===============================================
; OSX like keyboard mappings for Windows
; ===============================================

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Docs:
; https://autohotkey.com/docs/Hotkeys.htm
; https://autohotkey.com/docs/KeyList.htm
;
; ! = ALT
; ^ = CTRL
; + = SHIFT
; # = WIN

; -----------------------------------------------
; General mappings
; -----------------------------------------------

; Swap Left Alt and Left Control
LAlt::LCtrl
LCtrl::LAlt

; Remaps Capslock to Right Control
Capslock::RCtrl

; Kills app
!q::!F4


; -----------------------------------------------
; Windows switch (Keep Alt + Tab behavior)
; -----------------------------------------------

; If 'LAlt' is pressed, tab will send 'LCtrl up' to counter the 'LCtrl::LAlt' mapping
#If GetKeyState("LAlt", "P")
; Window switch
Tab::Send {LCtrl up}{Alt down}{Tab}

; Reverve window switch
`::Send {LCtrl up}{Alt down}{Shift down}{Tab}{Shift up}

; Reverts to Ctrl behavior when window switch is closed
Esc::Send {LAlt up}{LCtrl down}
#If

; Since 'LAlt up' sends 'LCtrl up' we need it to also send 'Alt up' to get rid of the AltTab menu.
LAlt up::Send {Alt up}{Ctrl up}


; -----------------------------------------------
; Text navigation, selection and manipulation
; -----------------------------------------------

; Mappings with Alt key
#If GetKeyState("LAlt", "P")
Left::Send {Home}
Right::Send {End}
Up::Send {Lctrl down}{Home}{Lctrl up}
Down::Send {Lctrl down}{End}{Lctrl up}
+Left::Send {shift down}{Home}{shift up}
+Right::Send {shift down}{End}{shift up}
+Up::Send {Ctrl Down}{shift down}{Home}{shift up}{Ctrl Up}
+Down::Send {Ctrl Down}{shift down}{End}{shift up}{Ctrl Up}
BS::Send {LShift down}{Home}{BS}{LShift Up}
#If

; Mappings with Win key
#Left::Send {Lctrl down}{left}{Lctrl up}
#Right::Send {Lctrl down}{right}{Lctrl up}
#+Left::Send {Ctrl Down}{shift down}{left}{shift up}{Ctrl Up}
#+Right::Send {Ctrl Down}{shift down}{right}{shift up}{Ctrl Up}
#BS::Send {LCtrl down}{BS}{LCtrl up}


; -----------------------------------------------
; Screenshots
; -----------------------------------------------

#If GetKeyState("LAlt", "P")
; Entire screen with Alt + Shift + 3
+3::Send #{PrintScreen}

; Portion screen with Alt + Shift + 4
+4::Send #{S}
#If

; -----------------------------------------------
; Testing
; -----------------------------------------------

; Window positioning
#^=::WinMaximize, A
#^-::WinRestore, A

; Workspace navigation
#1::Send {LWin Down}{ctrl down}{left}{ctrl up}{LWin Up}
#2::Send {LWin Down}{ctrl down}{right}{ctrl up}{LWin Up}
