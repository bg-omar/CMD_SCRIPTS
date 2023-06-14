' datetime.vbs

' Print out various ways of getting date and time information in VBScript
' running under Windows Scripting Host (WSH).

' Usage: > cscript.exe /nologo datetime.vbs

Dim wmi 
Set wmi = GetObject("winmgmts:root\cimv2")

' http://msdn.microsoft.com/en-us/library/aa394239%28v=vs.85%29.aspx
' http://include.wutils.com/wmi/ROOT%5Ccimv2/CIM_ManagedSystemElement/CIM_LogicalElement/CIM_OperatingSystem/Win32_OperatingSystem.html
WScript.Echo "Set os = GetObject(""winmgmts:root\cimv2:Win32_OperatingSystem=@"")"
Dim os : Set os = GetObject("winmgmts:root\cimv2:Win32_OperatingSystem=@")
WScript.Echo "os.LocalDateTime = " & os.LocalDateTime
WScript.Echo "Left(os.LocalDateTime, 4)    = " & Left(os.LocalDateTime, 4)    & " ' year"
WScript.Echo "Mid(os.LocalDateTime, 5, 2)  = " & Mid(os.LocalDateTime, 5, 2)  & "   ' month"
WScript.Echo "Mid(os.LocalDateTime, 7, 2)  = " & Mid(os.LocalDateTime, 7, 2)  & "   ' day"
WScript.Echo "Mid(os.LocalDateTime, 9, 2)  = " & Mid(os.LocalDateTime, 9, 2)  & "   ' hour"
WScript.Echo "Mid(os.LocalDateTime, 11, 2) = " & Mid(os.LocalDateTime, 11, 2) & "   ' minute"
WScript.Echo "Mid(os.LocalDateTime, 13, 2) = " & Mid(os.LocalDateTime, 13, 2) & "   ' second"
WScript.Echo

' http://msdn.microsoft.com/en-us/library/aa394498.aspx
' http://include.wutils.com/wmi/ROOT%5Ccimv2/CIM_Setting/Win32_TimeZone.html#vbscript
WScript.Echo "Set timeZones = wmi.ExecQuery(""SELECT Bias, Caption FROM Win32_TimeZone"")"
Dim timeZones: Set timeZones = wmi.ExecQuery("SELECT Bias, Caption FROM Win32_TimeZone")
WScript.Echo "For Each tz In timeZones"
For Each tz In timeZones
	WScript.Echo "    tz.Bias    = " & tz.Bias
	WScript.Echo "    tz.Caption = " & tz.Caption
Next
WScript.Echo "Next"

Dim n : n = os.LocalDateTime
Dim d : d = #2/29/2016#
Dim t : t = #1:02:03 PM#
WScript.Echo "Now   = " & n
WScript.Echo "Date  = " & d
WScript.Echo "Time  = " & t
WScript.Echo "Timer = " & Timer & "     ' seconds since midnight"
WScript.Echo

' http://msdn.microsoft.com/en-us/library/office/gg251489.aspx
'Const vbGeneralDate = 0
'Const vbLongDate    = 1
'Const vbShortDate   = 2
'Const vbLongTime    = 3
'Const vbShortTime   = 4

WScript.Echo "FormatDateTime(Now)                = " & FormatDateTime(n)
WScript.Echo "FormatDateTime(Now, vbGeneralDate) = " & FormatDateTime(n, vbGeneralDate)
WScript.Echo "FormatDateTime(Now, vbLongDate)    = " & FormatDateTime(n, vbLongDate)
WScript.Echo "FormatDateTime(Now, vbShortDate)   = " & FormatDateTime(n, vbShortDate)
WScript.Echo "FormatDateTime(Now, vbLongTime)    = " & FormatDateTime(n, vbLongTime)
WScript.Echo "FormatDateTime(Now, vbShortTime)   = " & FormatDateTime(n, vbShortTime)
WScript.Echo

WScript.Echo "Year(Now)   = " & Year(n)
WScript.Echo "Month(Now)  = " & Month(n)
WScript.Echo "Day(Now)    = " & Day(n)
WScript.Echo "Hour(Now)   = " & Hour(n)
WScript.Echo "Minute(Now) = " & Minute(n)
WScript.Echo "Second(Now) = " & Second(n)
WScript.Echo

WScript.Echo "Year(Date)   = " & Year(d)
WScript.Echo "Month(Date)  = " & Month(d)
WScript.Echo "Day(Date)    = " & Day(d)
WScript.Echo

WScript.Echo "Hour(Time)   = " & Hour(t)
WScript.Echo "Minute(Time) = " & Minute(t)
WScript.Echo "Second(Time) = " & Second(t)
WScript.Echo

Function LPad (str, pad, length)
    ' http://www.vbforums.com/showthread.php?676463-Right-Pad-and-Left-Pad-in-VBScript
    LPad = String(length - Len(str), pad) & str
End Function
WScript.Echo "Function LPad (str, pad, length)"
WScript.Echo "    LPad = String(length - Len(str), pad) & str"
WScript.Echo "End Function"
WScript.Echo

WScript.Echo "LPad(Month(Date), ""0"", 2)    = " & LPad(Month(d), "0", 2)
WScript.Echo "LPad(Day(Date), ""0"", 2)      = " & LPad(Day(d), "0", 2)
WScript.Echo "LPad(Hour(Time), ""0"", 2)     = " & LPad(Hour(t), "0", 2)
WScript.Echo "LPad(Minute(Time), ""0"", 2)   = " & LPad(Minute(t), "0", 2)
WScript.Echo "LPad(Second(Time), ""0"", 2)   = " & LPad(Second(t), "0", 2)
WScript.Echo

WScript.Echo "Weekday(Now)                     = " & Weekday(n)
WScript.Echo "WeekdayName(Weekday(Now), True)  = " & WeekdayName(Weekday(n), True)
WScript.Echo "WeekdayName(Weekday(Now), False) = " & WeekdayName(Weekday(n), False)
WScript.Echo "WeekdayName(Weekday(Now))        = " & WeekdayName(Weekday(n))
WScript.Echo

WScript.Echo "MonthName(Month(Now), True)  = " & MonthName(Month(n), True)
WScript.Echo "MonthName(Month(Now), False) = " & MonthName(Month(n), False)
WScript.Echo "MonthName(Month(Now))        = " & MonthName(Month(n))
WScript.Echo

