; <-- this is a comment
; ^ =  {Ctrl}
; + =  {Shift}    
; ! =  {Alt}
; {Right} {WheelDown}, {WheelUp}, {Left}, {Del}


; TEAMS: Mute mic with ctrl + side buttons
GroupAdd, TeamsGroup, ahk_class Chrome_WidgetWin_1
#IF WinActive("ahk_exe Teams.exe")
	XButton1::^+M
	XButton2::^+M
	Mbutton::^+O
#IF 

; Notepad++: Delete entire word with ctrl + delete or ctrl + backspace
GroupAdd, NoteGroup, ahk_class Notepad++
#IF WinActive("ahk_exe notepad++.exe")
	^BS::Send ^+{Left}{Del}
	^Del::Send ^+{Right}{Del}
#IF 

; INTELLIJ: Delete entire word with ctrl + delete or ctrl + backspace
;           Refactor Rename: Shift + mouse sidebutton
GroupAdd, IdeaGroup, ahk_class SunAwtFrame
#IF WinActive("ahk_exe idea64.exe")
	^BS::Send ^+{Left}{Del}
	^Del::Send ^+{Right}{Del}
	+XButton1::Send ^!1
	^XButton1::Send ^!2
	!XButton1::Send ^!5
	+XButton2::Send +{F6}
	+Mbutton::Send !{F12}
#IF 

; CHROME: Shift | ctrl + sidebuttons = Console / full screen / Bookmarkbar
;         Shift | ctrl + scroll button = Inspect
GroupAdd, ChromeGroup, ahk_class Chrome_WidgetWin_1
#IF WinActive("ahk_exe chrome.exe")
	+XButton1::Send {F12}
	+XButton2::Send ^+B
	+Mbutton::Send ^+C
	^XButton1::Send {F11}
	^XButton2::Send ^+B
	^Mbutton::Send ^+C
#IF 
