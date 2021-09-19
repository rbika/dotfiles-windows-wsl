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

; Remaps Ctrl, Alt and Capslock
LAlt::LCtrl
LCtrl::LAlt
Capslock::RCtrl

; -----------------------------------------------
; Windows and workspaces
; -----------------------------------------------

; Window positioning
^+=::WinMaximize, A
^+-::WinRestore, A

; Workspace navigation
#1::Send #^{left}
#2::Send #^{right}

; Opens spotlight
^Space::Send {LCtrl up}#s

; -----------------------------------------------
; Window switch (Keep Alt + Tab behavior)
; -----------------------------------------------

; If 'LAlt' is pressed, tab will send 'LCtrl up' to counter the 'LCtrl::LAlt' 
; mapping
#if GetKeyState("LAlt", "P")
  ; Window switch
  Tab::Send {LCtrl up}{Alt down}{Tab}

  ; Reverve window switch
  `::Send {LCtrl up}{Alt down}{Shift down}{Tab}{Shift up} ; en-US keyboard
  '::Send {LCtrl up}{Alt down}{Shift down}{Tab}{Shift up} ; pt-BR keyboard

  ; Reverts to Ctrl behavior when window switch is closed
  Esc::Send {Esc}{LAlt up}{LCtrl down}
#if

; Since 'LAlt up' sends 'LCtrl up' we need it to also send 'Alt up' to get rid
; of the AltTab menu
LAlt up::Send {Alt up}{Ctrl up}

; -----------------------------------------------
; Text navigation, selection and manipulation
; -----------------------------------------------

; Mappings with Alt key
#if GetKeyState("LAlt", "P")
  Left::Send {left}{Home}
  Right::Send {right}{End}
  Up::Send {up}{Lctrl down}{Home}{Lctrl up}
  Down::Send {down}{Lctrl down}{End}{Lctrl up}
  +Left::Send {shift down}{Home}{shift up}
  +Right::Send {shift down}{End}{shift up}
  +Up::Send {Ctrl down}{shift down}{Home}{shift up}{Ctrl up}
  +Down::Send {Ctrl down}{shift down}{End}{shift up}{Ctrl up}
  BS::Send {LShift down}{Home}{BS}{LShift up}
#if

; Mappings with Win key
#Left::Send {Lctrl down}{left}{Lctrl up}
#Right::Send {Lctrl down}{right}{Lctrl up}
#+Left::Send {Ctrl down}{shift down}{left}{shift up}{Ctrl up}
#+Right::Send {Ctrl down}{shift down}{right}{shift up}{Ctrl up}
#BS::Send {LCtrl down}{BS}{LCtrl up}

; -----------------------------------------------
; Apps
; -----------------------------------------------

; Kills app
^q::Send !{F4}

; Chrome's inspector
^#i::Send {F12}

; -----------------------------------------------
; MacOS special characters
; -----------------------------------------------

#c::Send ç
#8::Send •
#9::Send ª
#0::Send º
#[::Send “
#]::Send ‘
#;::Send …

; Shift variations
#+c::Send Ç
#+[::Send ”
#+]::Send ’

; -----------------------------------------------
; MacOS accentuation
; -----------------------------------------------

#if !GetKeyState("LAlt", "P")
  #`::previewAccent("``")
  #e::previewAccent("´")
  #i::previewAccent("ˆ")
  #n::previewAccent("˜")

  $a::accentedLetter("a,A", "à,À,á,Á,â,Â,ã,Ã")
  $e::accentedLetter("e,E", "è,È,é,É,ê,Ê,e,E")
  $i::accentedLetter("i,I", "ì,Ì,í,Í,î,Î,i,I")
  $o::accentedLetter("o,O", "ò,Ò,ó,Ó,ô,Ô,õ,Õ")
  $u::accentedLetter("u,U", "ù,Ù,ú,Ú,û,Û,u,U")
#if

previewAccent(accent) {
  Send % accent
  Send {left}+{right}
}

accentedLetter(regular, accented) {
  regularArray := StrSplit(regular, ",")
  accentedArray := StrSplit(accented, ",")

  if (GetKeyState("Shift"))
    shiftState := 1
  else
    shiftState := 0

  if (A_PriorHotKey = "#``") {
    Send % accentedArray[1 + shiftState]
  } else if (A_PriorHotKey = "#e") {
    Send % accentedArray[3 + shiftState]
  } else if (A_PriorHotKey = "#i") {
    Send % accentedArray[5 + shiftState]
  } else if (A_PriorHotKey = "#n") {
    Send % accentedArray[7 + shiftState]
  } else {
    Send % regularArray[1 + shiftState]
  }
}
