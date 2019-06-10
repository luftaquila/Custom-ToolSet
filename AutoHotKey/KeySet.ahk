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

<+CapsLock::CapsLock
CapsLock::LControl

LAlt & J:: Left
LAlt & K:: Down
LAlt & I:: Up
LAlt & L:: Right

VK19::
	p := Morse()
	If (p = "0")
		 Send ^v
	Else If (p = "00")
		 Send ^c
	Else If (p = "000")
		 Send ^x
	Else
		 Send {AppsKey}
Return

~LButton & RButton Up::Send {XButton2}
~RButton & LButton Up::Send {XButton1}
^+`::Run, Process Explorer.lnk, C:\Users\LUFT-AQUILA\AppData\Roaming\Microsoft\Windows\Start Menu\Programs

RShift::BS
BS::LControl

:*C:alpha`t::��
:*C:beta`t::��
:*C:gamma`t::��
:*C:delta`t::��
:*C:epsilon`t::��
:*C:zeta`t::��
:*C:eta`t::��
:*C:theta`t::��
:*C:iota`t::��
:*C:kappa`t::��
:*C:lambda`t::��
:*C:mu`t::��
:*C:nu`t::��
:*C:xi`t::��
:*C:omicron`t::��
:*C:pi`t::��
:*C:rho`t::��
:*C:sigma`t::��
:*C:tau`t::��
:*C:upsilon`t::��
:*C:phi`t::��
:*C:chi`t::��
:*C:psi`t::��
:*C:omega`t::��
:*C:Alpha`t::��
:*C:Beta`t::��
:*C:Gamma`t::��
:*C:Delta`t::��
:*C:Epsilon`t::��
:*C:Zeta`t::��
:*C:Eta`t::��
:*C:Theta`t::��
:*C:Iota`t::��
:*C:Kappa`t::��
:*C:Lambda`t::��
:*C:Mu`t::��
:*C:Nu`t::��
:*C:Xi`t::��
:*C:Omicron`t::��
:*C:Pi`t::��
:*C:Rho`t::��
:*C:Sigma`t::��
:*C:Tau`t::��
:*C:Upsilon`t::��
:*C:Phi`t::��
:*C:Chi`t::��
:*C:Psi`t::��
:*C:Omega`t::��

:*:wheart::��
:*:bheart::��
:*:wstar::��
:*:bstar::��
:*C:ud::_

:*:uarr::��
:*:darr::��
:*:larr::��
:*:rarr::��

:*R:kk`t::rokaFKAk512#
:*R:pr`t::rokaFPRo512#
:*R:lu`t::luftaquila
:*R:em`t::luftaquila@protonmail.ch
:*R:pv`t::perfidemvolo

Morse(timeout = 80) { ;by Laszo -> http://www.autohotkey.com/forum/viewtopic.php?t=16951 (Modified to return: KeyWait %key%, T%tout%)
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
