#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.

;~ variables
tempArray1 := {}
;~ tempArray2 := {}
tempArray3 := {}
tempArray4 := {}

;~ get source
clipboard := ""
ToolTip, �����N�X��q��@�������r
ClipWait, 60
if ErrorLevel
{
    MsgBox, The attempt to copy failed.
    Exit
}
StringTrimRight, NewClipboard, Clipboard, 2 ;remove last string "`r`n"
Loop, parse, NewClipboard, `t`n
{
	StringReplace, NewStr, A_LoopField, `r, , All
	StringReplace, NewStr, NewStr, `n, , All
	tempArray1.Insert(NewStr)
}

;~ get target
ToolTip, ���������N���ءq��@�������r
clipboard := ""
ClipWait, 60
if ErrorLevel
{
    MsgBox, The attempt to copy failed.
    Exit
}
StringTrimRight, NewClipboard, Clipboard, 2 ;remove last string "`r`n"
Loop, parse, NewClipboard, `n
{
	StringReplace, NewStr, A_LoopField, `r, , All
	StringReplace, NewStr, NewStr, `n, , All
	tempArray3.Insert(NewStr)
}

;~ matching
for k3, v3 in tempArray3
{
	checker := 0
	for k1, v1 in tempArray1
	{
		IfInString, v3, %v1%
		{
			checker := k1
			break
		}
		;~ v3L := StrLen(v3)
		;~ v1L := StrLen(v1)
		;~ MsgBox, target: %v3% %v3L%`n source: %v1% %v1L%`n match: %checker%
	}
	if (checker == 0)
		tempArray4.Insert(v3)
	else
		tempArray4.Insert(tempArray1[checker-1])
}
s := ""
For k, v in tempArray4
    s .= v "`n"
clipboard := s
ToolTip, �ഫ�����A�N�X��ŶKï��
Sleep, 1000
ToolTip
;~ MsgBox, result:`n%s%