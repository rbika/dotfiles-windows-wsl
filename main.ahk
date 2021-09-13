; ===============================================
; OSX like keyboard mappings for Windows
; ===============================================

#NoEnv
#SingleInstance, force 
SendMode Input
SetWorkingDir %A_ScriptDir%

; ! = ALT
; ^ = CTRL
; + = SHIFT
; # = WIN

; -----------------------------------------------
; General mappings
; -----------------------------------------------

; Remaps Ctrl, Alt, Win and Capslock
LAlt::LCtrl
LCtrl::LWin
LWin::LAlt
Capslock::RCtrl


; -----------------------------------------------
; Windows and workspaces
; -----------------------------------------------

; Window positioning
^+=::WinMaximize, A
^+-::WinRestore, A

; Shows Desktop
!d::Send #d

; Run command (testing)
!r::Send #r

; Workspace navigation
!1::Send #^{left}
!2::Send #^{right}

; Opens spotlight
#if GetKeyState("LAlt", "P")
Space::Send {LCtrl up}#s
#if


; -----------------------------------------------
; Window switch (Keep Alt + Tab behavior)
; -----------------------------------------------

; If 'LAlt' is pressed, tab will send 'LCtrl up' to counter the 'LCtrl::LAlt' mapping
#if GetKeyState("LAlt", "P")
; Window switch
Tab::Send {LCtrl up}{Alt down}{Tab}

; Reverve window switch
`::Send {LCtrl up}{Alt down}{Shift down}{Tab}{Shift up} ; en-US keyboard
'::Send {LCtrl up}{Alt down}{Shift down}{Tab}{Shift up} ; pt-BR keyboard

; Reverts to Ctrl behavior when window switch is closed
Esc::Send {Esc}{LAlt up}{LCtrl down}
#if

; Since 'LAlt up' sends 'LCtrl up' we need it to also send 'Alt up' to get rid of the AltTab menu
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
+Up::Send {Ctrl down}{shift down}{Home}{shift up}{Ctrl up}
+Down::Send {Ctrl down}{shift down}{End}{shift up}{Ctrl up}
BS::Send {LShift down}{Home}{BS}{LShift up}
#If

; Mappings with Win key
!Left::Send {Lctrl down}{left}{Lctrl up}
!Right::Send {Lctrl down}{right}{Lctrl up}
!+Left::Send {Ctrl down}{shift down}{left}{shift up}{Ctrl up}
!+Right::Send {Ctrl down}{shift down}{right}{shift up}{Ctrl up}
!BS::Send {LCtrl down}{BS}{LCtrl up}


; -----------------------------------------------
; Apps
; -----------------------------------------------

; Kills app
^q::Send !{F4}

; Chrome's inspector
^!i::Send ^+i


; -----------------------------------------------
; Special characters (testing)
; -----------------------------------------------

!c::Send {asc 0231} ; ç
!+c::Send {asc 128} ; Ç
!8::Send {asc 0149} ; •
!+8::Send {asc 248} ; °
!9::Send {asc 166} ; ª
!0::Send {asc 167} ; º
![::Send {asc 0147} ; “
!+[::Send {asc 0148} ; ”
!]::Send {asc 0145} ; ‘
!+]::Send {asc 0146} ; ’
!;::Send {asc 0133} ; …
