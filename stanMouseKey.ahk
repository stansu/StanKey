#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Recommended for catching common errors.
#SingleInstance, force ;Avoid multiple thread.
SetControlDelay 0
#UseHook
CoordMode, ToolTip, Screen

mouseToggle := false

CapsLock::
Critical, off
mouseToggle := not mouseToggle
ToolTip, %mouseToggle%
Sleep, 500
ToolTip
return

+CapsLock::CapsLock

#If not WinExist("stanKey_") and mouseToggle == true
c::LButton
s::MButton
a::RButton

LButton::c
MButton::s
RButton::a

#If WinActive("stanMouseKey.ahk")
^s::
SendInput, ^s
Reload
return
