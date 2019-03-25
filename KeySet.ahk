#SingleInstance force
menu, tray, NoStandard
menu, tray, add, Exit
Return

Exit:
	exitapp
Return

<+Space::VK15
VK15::<+Space
RShift::RapidHotkey("^v""^c", "1""2")

~LButton & RButton Up::Send {XButton2}
~RButton & LButton Up::Send {XButton1}

^+`::Run, Process Explorer.lnk, C:\Users\LUFT-AQUILA\AppData\Roaming\Microsoft\Windows\Start Menu\Programs
VK15::Run cmd

VK19::
	Send ^+{Left}
	send ^x
	src = %clipboard%
	pos := asc(SubStr(src, 1, 1))
	if (pos >= 97) && (pos <= 122) || (pos >= 129) && (pos <= 200)
		gosub eng
	else
		gosub kor
Return

eng:
	Send {VK15}
	Loop, Parse, src
	SendRaw %A_LoopField%
return

kor:
	dic := ["??", "??", "??", "??", "??", "??", "??", "??", "??", "??", "??", "??", "??", "??", "??", "??", "??", "??", "??", "??, "??, "??", "??", "??, "??, "??, "??, "??, "??, "??", "??, "??, "??, "??, "??, "??, "??, "??, "??, "??]
	eng := ["r", "s", "e", "f", "a", "q", "t", "d", "w", "c", "z", "x", "v", "g", "R", "E", "Q", "T", "W", "l", "p", "o", "k", "n", "h", "j", "m", "nl", "hl", "i", "u", "y", "b", "O", "P", "hk", "nj", "ho", "np", "ml"]
	Send {VK15}
	Loop, Parse, src
	{
		syl := asc(A_LoopField)
		if (syl >= 12593) && (syl <= 12643)
		{
			for index, element in dic
			{
				ifEqual, A_LoopField, %element%
				{
					str := eng[index]
					Send %str%
				}
			}
		}
		else if (syl >= 44032) && (syl <= 55203)
		{
			top := Floor((syl - 44032) / 588)
			top := Chr(12593 + top + (top < 2 ? 0 : top < 3 ? 1 : top < 6 ? 3 : top < 9 ? 10 : 11))
			mid := Chr(Floor(Mod((syl - 44032), 588) / 28) + 12623)
			bot := Mod((syl - 44032), 28)
			bot := bot ? Chr(12592 + bot + (bot < 8 ? 0 : bot < 18 ? 1 : bot < 23 ? 2 : 3)) : ""
			for index, element in dic
			{
				ifEqual, top, %element%
					topS := eng[index]
				else ifEqual, mid, %element%
					midS := eng[index]
				else ifEqual, bot, %element%
					botS := eng[index]
			}
			Send %topS%
			Send %midS%
			Send %botS%
		}
	}
Return

:*C:alpha`t::??
:*C:beta`t::??
:*C:gamma`t::??
:*C:delta`t::??
:*C:epsilon`t::??
:*C:zeta`t::??
:*C:eta`t::??
:*C:theta`t::??
:*C:iota`t::??
:*C:kappa`t::??
:*C:lambda`t::??
:*C:mu`t::??
:*C:nu`t::??
:*C:xi`t::??
:*C:omicron`t::??
:*C:pi`t::??
:*C:rho`t::??
:*C:sigma`t::??
:*C:tau`t::??
:*C:upsilon`t::??
:*C:phi`t::??
:*C:chi`t::??
:*C:psi`t::??
:*C:omega`t::??
:*C:Alpha`t::??
:*C:Beta`t::??
:*C:Gamma`t::??
:*C:Delta`t::??
:*C:Epsilon`t::??
:*C:Zeta`t::??
:*C:Eta`t::??
:*C:Theta`t::??
:*C:Iota`t::??
:*C:Kappa`t::??
:*C:Lambda`t::??
:*C:Mu`t::??
:*C:Nu`t::??
:*C:Xi`t::??
:*C:Omicron`t::??
:*C:Pi`t::??
:*C:Rho`t::??
:*C:Sigma`t::??
:*C:Tau`t::??
:*C:Upsilon`t::??
:*C:Phi`t::??
:*C:Chi`t::??
:*C:Psi`t::??
:*C:Omega`t::??

:*:heartw::??
:*:heartb::??
:*:starw::??
:*:starb::??

:*:arru::??
:*:arrd::??
:*:arrl::??
:*:arrr::??

RapidHotkey(keystroke, times="2", delay=0.2, IsLabel=0)
{
	Pattern := Morse(delay*1000)
	If (StrLen(Pattern) < 2 and Chr(Asc(times)) != "1")
		Return
	If (times = "" and InStr(keystroke, """"))
	{
		Loop, Parse, keystroke,""
			If (StrLen(Pattern) = A_Index+1)
				continue := A_Index, times := StrLen(Pattern)
	}
	Else if (RegExMatch(times, "^\d+$") and InStr(keystroke, """"))
	{
		Loop, Parse, keystroke,""
			If (StrLen(Pattern) = A_Index+times-1)
				times := StrLen(Pattern), continue := A_Index
	}
	Else if InStr(times, """")
	{
		Loop, Parse, times,""
			If (StrLen(Pattern) = A_LoopField)
				continue := A_Index, times := A_LoopField
	}
	Else if (times = "")
		continue := 1, times := 2
	Else if (times = StrLen(Pattern))
		continue = 1
	If !continue
		Return
	Loop, Parse, keystroke,""
		If (continue = A_Index)
			keystr := A_LoopField
	Loop, Parse, IsLabel,""
		If (continue = A_Index)
			IsLabel := A_LoopField
	hotkey := RegExReplace(A_ThisHotkey, "[\*\~\$\#\+\!\^]")
	IfInString, hotkey, %A_Space%
		StringTrimLeft, hotkey,hotkey,% InStr(hotkey,A_Space,1,0)
	backspace := "{BS " times "}"
	keywait = Ctrl|Alt|Shift|LWin|RWin
	Loop, Parse, keywait, |
		KeyWait, %A_LoopField%
	If ((!IsLabel or (IsLabel and IsLabel(keystr))) and InStr(A_ThisHotkey, "~") and !RegExMatch(A_ThisHotkey
	, "i)\^[^\!\d]|![^\d]|#|Control|Ctrl|LCtrl|RCtrl|Shift|RShift|LShift|RWin|LWin|Alt|LAlt|RAlt|Escape|BackSpace|F\d\d?|"
	. "Insert|Esc|Escape|BS|Delete|Home|End|PgDn|PgUp|Up|Down|Left|Right|ScrollLock|CapsLock|NumLock|AppsKey|"
	. "PrintScreen|CtrlDown|Pause|Break|Help|Sleep|Browser_Back|Browser_Forward|Browser_Refresh|Browser_Stop|"
	. "Browser_Search|Browser_Favorites|Browser_Home|Volume_Mute|Volume_Down|Volume_Up|MButton|RButton|LButton|"
	. "Media_Next|Media_Prev|Media_Stop|Media_Play_Pause|Launch_Mail|Launch_Media|Launch_App1|Launch_App2"))
		Send % backspace
	If (WinExist("AHK_class #32768") and hotkey = "RButton")
		WinClose, AHK_class #32768
	If !IsLabel
		Send % keystr
	else if IsLabel(keystr)
		Gosub, %keystr%
	Return
}
Morse(timeout = 400) { ;by Laszo -> http://www.autohotkey.com/forum/viewtopic.php?t=16951 (Modified to return: KeyWait %key%, T%tout%)
   tout := timeout/1000
   key := RegExReplace(A_ThisHotKey,"[\*\~\$\#\+\!\^]")
   IfInString, key, %A_Space%
		StringTrimLeft, key, key,% InStr(key,A_Space,1,0)
	If Key in Shift,Win,Ctrl,Alt
		key1:="{L" key "}{R" key "}"
   Loop {
      t := A_TickCount
      KeyWait %key%, T%tout%
		Pattern .= A_TickCount-t > timeout
		If(ErrorLevel)
			Return Pattern
    If key in Capslock,LButton,RButton,MButton,ScrollLock,CapsLock,NumLock
      KeyWait,%key%,T%tout% D
    else if Asc(A_ThisHotkey)=36
		KeyWait,%key%,T%tout% D
    else
      Input,pressed,T%tout% L1 V,{%key%}%key1%
	If (ErrorLevel="Timeout" or ErrorLevel=1)
		Return Pattern
	else if (ErrorLevel="Max")
		Return
   }
}
