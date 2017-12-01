#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Recommended for catching common errors.
#SingleInstance, force ;Avoid multiple thread.
#Persistent
tileToggle := false

LShift & LAlt::
;~ WinMinimizeAll
WinGet, id, list
Loop, %id%
{
    this_id := id%A_Index%
    WinGetClass, this_class, ahk_id %this_id%
	if (this_class == "QWidget")
	{
		WinGet, winState, MinMax, ahk_id %this_id%
		if (winState == -1)
		{
			WinRestore, ahk_id %this_id%
		}
	}
	else if (this_class == "HH Parent")
	{
		WinClose, ahk_id %this_id%
	}
	else
	{
		WinMinimize, ahk_id %this_id%
	}
}

if tileToggle
{
	DllCall( "TileWindows", uInt,0, Int,0, Int,0, Int,0, Int,0 ) ; Tile Vertically
}
else
{
	DllCall( "TileWindows", uInt,0, Int,1, Int,0, Int,0, Int,0 ) ; Tile Horizontally
}
tileToggle := not tileToggle

return