 ' https://vbsedit.adersoft.com/vo.asp
 ' https://ss64.com/vb/sendkeys.html  <---  all keys
 ' Get system time date
Dim os : Set os = GetObject("winmgmts:root\cimv2:Win32_OperatingSystem=@")

 ' Get minutes idle input, or set 5 min
If WScript.Arguments.Count = 1 Then
 SleepTime = WScript.Arguments.Item(0)
Else
 Wscript.Echo "Usage: idle.vbs 1 (for sleeptime = 1 minute)"
 Wscript.Echo "   Testing with sleeptime = 1"
 SleepTime = 5
End If

Dim objResult
Set objShell = WScript.CreateObject("WScript.Shell")  
WScript.Echo
WScript.Echo " Now = " & Mid(os.LocalDateTime, 9, 2)  & ":" & Mid(os.LocalDateTime, 11, 2)  & ":" & Mid(os.LocalDateTime, 13, 2) ' Show time at start
WScript.Echo
		WScript.Echo "                          Idle minutes left:   "
for i = 1 To SleepTime
	Do
		If i = SleepTime Then Exit Do
		If i Mod 5 = 0 Then                          ' every 5 Minutes press INSERT button twice
            objResult = objShell.sendkeys("{INSERT}")
            Wscript.Sleep (5)
            objResult = objShell.sendkeys("{INSERT}")
		End If
		WScript.Echo "                      ---------->  " & (SleepTime-(i-1)) & "  <---------- " ' Show amount minutes left
		Wscript.Sleep (60000) ' Wait minute
	Loop While False
Next
WScript.Echo
MsgBox("EXIT idle SleepTime script")
Wscript.Echo "EXIT idle SleepTime script"
WScript.Quit
