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

; Swaps Left Alt and Left Control
LAlt::LCtrl
LCtrl::LAlt

; Remaps Capslock to Right Control
Capslock::RCtrl

; Kills app
^q::Send {Alt down}{F4}{Alt up}

; Window positioning
^+=::WinMaximize, A
^+-::WinRestore, A

; Workspace navigation
#1::Send {LWin Down}{ctrl down}{left}{ctrl up}{LWin Up}
#2::Send {LWin Down}{ctrl down}{right}{ctrl up}{LWin Up}

; Chrome's inspector
^#i::Send ^+i

; Opens spotlight
#If GetKeyState("LAlt", "P")
Space::Send {LCtrl up}{LWin Down}{s}{LWin Up}
#If

; -----------------------------------------------
; Window switch (Keep Alt + Tab behavior)
; -----------------------------------------------

; If 'LAlt' is pressed, tab will send 'LCtrl up' to counter the 'LCtrl::LAlt' mapping
#If GetKeyState("LAlt", "P")
; Window switch
Tab::Send {LCtrl up}{Alt down}{Tab}

; Reverve window switch
`::Send {LCtrl up}{Alt down}{Shift down}{Tab}{Shift up} ; en-US keyboard
'::Send {LCtrl up}{Alt down}{Shift down}{Tab}{Shift up} ; pt-BR keyboard

; Reverts to Ctrl behavior when window switch is closed
Esc::Send {Esc}{LAlt up}{LCtrl down}
#If

; Since 'LAlt up' sends 'LCtrl up' we need it to also send 'Alt up' to get rid of the AltTab menu.
LAlt up::Send {Alt up}{Ctrl up}


; -----------------------------------------------
; Text navigation, selection and manipulation
; -----------------------------------------------

; Mappings with Alt key
#If GetKeyState("LAlt", "P")
Left::Send {left}{Home}
Right::Send {right}{End}
Up::Send {up}{Lctrl down}{Home}{Lctrl up}
Down::Send {down}{Lctrl down}{End}{Lctrl up}
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

; Entire screen with Alt + Shift + 3
^+3::Send #{PrintScreen}

; Portion screen with Alt + Shift + 4
^+4::Send #+s

; -----------------------------------------------
; Testing
; -----------------------------------------------
; script to validate hotkeys
; <hotkey>::Send It works
