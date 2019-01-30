SetDefaultKeyboard(LocaleID) {
	Static SPI_SETDEFAULTINPUTLANG := 0x005A, SPIF_SENDWININICHANGE := 2

	Lan := DllCall("LoadKeyboardLayout", "Str", Format("{:08x}", LocaleID), "Int", 0)
	VarSetCapacity(binaryLocaleID, 4, 0)
	NumPut(LocaleID, binaryLocaleID)
	DllCall("SystemParametersInfo", "UInt", SPI_SETDEFAULTINPUTLANG, "UInt", 0, "UPtr", &binaryLocaleID, "UInt", SPIF_SENDWININICHANGE)

	WinGet, windows, List
	Loop % windows {
		PostMessage 0x50, 0, % Lan, , % "ahk_id " windows%A_Index%
	}
}
USA := 0x0409
KOR := 0x0412

toggle := False

<+Space::VK15
Return
VK19::
	Send ^+{Left}
	Send {Delete}
	SetDefaultKeyboard((toggle := !toggle) ? USA : KOR)
Return
VK15::
	Run cmd /F /T:07 /k "cd C:\Users\LUFT-AQUILA\Programs&&cmd&&exit"
Return
