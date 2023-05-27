#SingleInstance,Force
GroupAdd, VLCGroup, ahk_class Qt5QWindowIcon
#IF WinActive("ahk_exe vlc.exe")
	XButton1::
		Keywait, XButton1, T.4
		If ErrorLevel 
		{
			Send, .
			KeyWait,XButton1
		} else {
			Send, {Down} 
		}
	return	

	XButton2::
		Keywait, XButton2, T.4
		If ErrorLevel 
		{
			Send, /
			KeyWait,XButton2
		} else {
			Send, {Up} 
		}
	return	
	Mbutton::r
#IF 

	
GroupAdd, QbitGroup, ahk_class Qt630QWindowIcon
#IF WinActive("ahk_exe qbittorrent.exe")
	^BS::Send ^+{Left}{Del}
	^Del::Send ^+{Right}{Del}
	XButton1::^c
	XButton2::^v
	Mbutton::F2
#IF 

GroupAdd, NoteGroup, ahk_class Notepad++
#IF WinActive("ahk_exe notepad++.exe")
	^BS::Send ^+{Left}{Del}
	^Del::Send ^+{Right}{Del}
#IF 
