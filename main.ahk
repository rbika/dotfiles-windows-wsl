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

; Remaps Capslock to Right Control
Capslock::RCtrl

; Alt + * to Control + *
!a::Send ^a
!b::Send ^b
!c::Send ^c
!d::Send ^d
!e::Send ^e
!f::Send ^f
!g::Send ^g
!h::Send ^h
!i::Send ^i
!j::Send ^j
!k::Send ^k
!l::Send ^l
!m::Send ^m
!n::Send ^n
!o::Send ^o
!p::Send ^p
!q::Send ^q
!r::Send ^r
!s::Send ^s
!t::Send ^t
!u::Send ^u
!v::Send ^v
!w::Send ^w
!x::Send ^x
!y::Send ^y
!z::Send ^z
!1::Send ^1
!2::Send ^2
!3::Send ^3
!4::Send ^4
!5::Send ^5
!6::Send ^6
!7::Send ^7
!8::Send ^8
!9::Send ^9
!0::Send ^0
!/::Send ^/
!,::Send ^,
!Enter::Send ^{Enter}

; Alt + Shift + * to Control + Shift + *
!+a::Send ^+a
!+b::Send ^+b
!+c::Send ^+c
!+d::Send ^+d
!+e::Send ^+e
!+f::Send ^+f
!+g::Send ^+g
!+h::Send ^+h
!+i::Send ^+i
!+j::Send ^+j
!+k::Send ^+k
!+l::Send ^+l
!+m::Send ^+m
!+n::Send ^+n
!+o::Send ^+o
!+p::Send ^+p
!+q::Send ^+q
!+r::Send ^+r
!+s::Send ^+s
!+t::Send ^+t
!+u::Send ^+u
!+v::Send ^+v
!+w::Send ^+w
!+x::Send ^+x
!+y::Send ^+y
!+z::Send ^+z
!+Enter::Send ^+{Enter}

; Kills app
!q::!F4

; Window switch (reverse direction)
!`::Send {Alt Down}{Shift Down}{Tab}{Shift Up}

; Disables alt menu acceleration
~LAlt::
Sendinput {Blind}{sc0E9}
KeyWait, LAlt
Sendinput {Blind}{sc0EA}
return

; -----------------------------------------------
; Text navigation, selection and manipulation
; -----------------------------------------------

; Cursor navigation
!Left::Send {Home}
!Right::Send {End}
!Up::Send {Lctrl down}{Home}{Lctrl up}
!Down::Send {Lctrl down}{End}{Lctrl up}
#Left::Send {Lctrl down}{left}{Lctrl up}
#Right::Send {Lctrl down}{right}{Lctrl up}

; Cursor navigation with selection
!+Left::Send {shift down}{Home}{shift up}
!+Right::Send {shift down}{End}{shift up}
!+Up::Send {Ctrl Down}{shift down}{Home}{shift up}{Ctrl Up}
!+Down::Send {Ctrl Down}{shift down}{End}{shift up}{Ctrl Up}
#+Left::Send {Ctrl Down}{shift down}{left}{shift up}{Ctrl Up}
#+Right::Send {Ctrl Down}{shift down}{right}{shift up}{Ctrl Up}

; Line/word deletion
!BS::Send {LShift down}{Home}{LShift Up}{Del}
#BS::Send {LCtrl down}{BS}{LCtrl up}


; -----------------------------------------------
; Screenshots
; -----------------------------------------------

; Entire screen with Alt + Shift + 3
!+3::Send #{PrintScreen}

; Portion screen with Alt + Shift + 4
!+4::Send #{S}


; -----------------------------------------------
; Window positioning
; -----------------------------------------------

!+=::WinMaximize A


; -----------------------------------------------
; Testing
; -----------------------------------------------
;!{Click}::^{Click}
