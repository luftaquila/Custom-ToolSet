#SingleInstance force
menu, tray, NoStandard
menu, tray, add, Exit
Return

Exit:
	exitapp
Return

<+Space::VK15
VK15::<+Space
VK15::Run cmd

VK19::
	p := Morse()
	If (p = "0")
		 Send ^v
	Else If (p = "00")
		 Send ^c
	Else If (p = "1")
		 Send {AppsKey}
	;Else
	;	 MsgBox Press pattern %p%
Return

Space & J:: Left
Space & K:: Down
Space & I:: Up
Space & L:: Right
Tab & J:: Home
Tab & L:: End
Tab:: Send {Tab}
Space:: Send {Space}

~LButton & RButton Up::Send {XButton2}
~RButton & LButton Up::Send {XButton1}
^+`::Run, Process Explorer.lnk, C:\Users\LUFT-AQUILA\AppData\Roaming\Microsoft\Windows\Start Menu\Programs

RShift::BS

:*C:alpha`t::¥á
:*C:beta`t::¥â
:*C:gamma`t::¥ã
:*C:delta`t::¥ä
:*C:epsilon`t::¥å
:*C:zeta`t::¥æ
:*C:eta`t::¥ç
:*C:theta`t::¥è
:*C:iota`t::¥é
:*C:kappa`t::¥ê
:*C:lambda`t::¥ë
:*C:mu`t::¥ì
:*C:nu`t::¥í
:*C:xi`t::¥î
:*C:omicron`t::¥ï
:*C:pi`t::¥ð
:*C:rho`t::¥ñ
:*C:sigma`t::¥ò
:*C:tau`t::¥ó
:*C:upsilon`t::¥ô
:*C:phi`t::¥õ
:*C:chi`t::¥ö
:*C:psi`t::¥÷
:*C:omega`t::¥ø
:*R:kk`t::rokaFKAk512#
:*R:nn`t::rokaFNAv512#
:*R:]\::rokaFCom512#
:*C:Alpha`t::¥Á
:*C:Beta`t::¥Â
:*C:Gamma`t::¥Ã
:*C:Delta`t::¥Ä
:*C:Epsilon`t::¥Å
:*C:Zeta`t::¥Æ
:*C:Eta`t::¥Ç
:*C:Theta`t::¥È
:*C:Iota`t::¥É
:*C:Kappa`t::¥Ê
:*C:Lambda`t::¥Ë
:*C:Mu`t::¥Ì
:*C:Nu`t::¥Í
:*C:Xi`t::¥Î
:*C:Omicron`t::¥Ï
:*C:Pi`t::¥Ð
:*C:Rho`t::¥Ñ
:*C:Sigma`t::¥Ò
:*C:Tau`t::¥Ó
:*C:Upsilon`t::¥Ô
:*C:Phi`t::¥Õ
:*C:Chi`t::¥Ö
:*C:Psi`t::¥×
:*C:Omega`t::¥Ø

:*:wheart::¢½
:*:bheart::¢¾
:*:wstar::¡Ù
:*:bstar::¡Ú

:*:arru::¡è
:*:arrd::¡é
:*:arrl::¡ç
:*:arrr::¡æ

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
