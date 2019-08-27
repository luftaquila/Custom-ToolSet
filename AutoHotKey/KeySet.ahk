#SingleInstance force
menu, tray, NoStandard
menu, tray, add, Exit
Return

Exit:
	exitapp
Return

#Space::
<+Space::VK15
VK15::<+Space
VK15::Run SCHTASKS.EXE /RUN /TN "\UAC Whitelist\CMD"

<+CapsLock::CapsLock
CapsLock::LControl

LAlt & J:: Left
LAlt & K:: Down
LAlt & I:: Up
LAlt & L:: Right

VK19::Delete

~LButton & RButton Up::Send {XButton2}
~RButton & LButton Up::Send {XButton1}
^+`::Run, Process Explorer.lnk, C:\Users\LUFT-AQUILA\AppData\Roaming\Microsoft\Windows\Start Menu\Programs

RShift::BS
BS::LControl

#z:: HideShowTaskbar(hide := !hide)
HideShowTaskbar(action) {
   static ABM_SETSTATE := 0xA, ABS_AUTOHIDE := 0x1, ABS_ALWAYSONTOP := 0x2
   VarSetCapacity(APPBARDATA, size := 2*A_PtrSize + 2*4 + 16 + A_PtrSize, 0)
   NumPut(size, APPBARDATA), NumPut(WinExist("ahk_class Shell_TrayWnd"), APPBARDATA, A_PtrSize)
   NumPut(action ? ABS_AUTOHIDE : ABS_ALWAYSONTOP, APPBARDATA, size - A_PtrSize)
   DllCall("Shell32\SHAppBarMessage", UInt, ABM_SETSTATE, Ptr, &APPBARDATA)
}

:*C:alpha`t::α
:*C:beta`t::β
:*C:gamma`t::γ
:*C:delta`t::δ
:*C:epsilon`t::ε
:*C:zeta`t::ζ
:*C:eta`t::η
:*C:theta`t::θ
:*C:iota`t::ι
:*C:kappa`t::κ
:*C:lambda`t::λ
:*C:mu`t::μ
:*C:nu`t::ν
:*C:xi`t::ξ
:*C:omicron`t::ο
:*C:pi`t::π
:*C:rho`t::ρ
:*C:sigma`t::σ
:*C:tau`t::τ
:*C:upsilon`t::υ
:*C:phi`t::φ
:*C:chi`t::χ
:*C:psi`t::ψ
:*C:omega`t::ω
:*C:Alpha`t::Α
:*C:Beta`t::Β
:*C:Gamma`t::Γ
:*C:Delta`t::Δ
:*C:Epsilon`t::Ε
:*C:Zeta`t::Ζ
:*C:Eta`t::Η
:*C:Theta`t::Θ
:*C:Iota`t::Ι
:*C:Kappa`t::Κ
:*C:Lambda`t::Λ
:*C:Mu`t::Μ
:*C:Nu`t::Ν
:*C:Xi`t::Ξ
:*C:Omicron`t::Ο
:*C:Pi`t::Π
:*C:Rho`t::Ρ
:*C:Sigma`t::Σ
:*C:Tau`t::Τ
:*C:Upsilon`t::Υ
:*C:Phi`t::Φ
:*C:Chi`t::Χ
:*C:Psi`t::Ψ
:*C:Omega`t::Ω

:*:wheart::♡
:*:bheart::♥
:*:wstar::☆
:*:bstar::★
:*C:ud`t::_
:*:wdt::⚬

:*:uarr::↑
:*:darr::↓
:*:larr::←
:*:rarr::→
:*:ularr::↖
:*:urarr::↗
:*:dlarr::↙
:*:drarr::↘

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
