﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
run, D:\punchCard\time.txt
Sleep, 55
run, D:\punchCard\timeMon.txt
Sleep, 55
run, D:\punchCard\timeWed.txt