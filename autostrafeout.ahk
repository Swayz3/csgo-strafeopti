screenmid := A_ScreenWidth / 2
var1 = 10 ;sleep time
;######################################## - Status Options
status_as_x = 255
status_as_y = 8
status_as_size = 16 ; Font size
status_as_text = Auto Strafe ; Displayed Text
status_trix_x = 370
status_trix_y = 8
status_trix_size = 16
;########################################

#Persistent
#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#MaxThreadsPerHotkey 255
#KeyHistory 0
#InstallKeybdHook
SetWorkingDir %A_ScriptDir%
SendMode Input
drawString(status_as_x, status_as_y, status_as_text, 0xff0000, status_as_size, "", 008800)
SendInput {blind}{d up}
SendInput {blind}{a up}
#IfWinActive ahk_exe csgo.exe
$*Left::
Suspend, Toggle
drawString(status_as_x, status_as_y, status_as_text, 0x00ff00, status_as_size, "", 008800)

loop
{
if(GetKeyState("w", "p"))
{
	SendInput {blind}{d up}
	SendInput {blind}{a up}
	goto, Bhopstart
}
if(GetKeyState("a", "p"))
{
	SendInput {blind}{d up}
	goto, Bhopstart
}
if(GetKeyState("d", "p"))
{
	SendInput {blind}{a up}
	goto, Bhopstart
}
else
		MouseGetPos, x
		if (x>screenmid)
		{
			SendInput {blind}{a up}
			SendInput {blind}{d down}
		}
		else if (x<screenmid)
		{
			SendInput {blind}{d up}
			SendInput {blind}{a down}
		}
Bhopstart:
sleep %var1%
}
return

$*Left up::
{
	sleep 100
	SendInput {blind}{d up}
	SendInput {blind}{a up}
	sleep 20
	reload
}
return

~$*up::
while(GetKeyState("up", "p"))
{
	var1 += 1
	Gui, 3: destroy
	drawString3(status_trix_x, status_trix_y, var1, 0x00ff00, status_trix_size, "", 880000)
	SoundBeep
}
return

~$*down::
while(GetKeyState("down", "p"))
{
	var1 -= 1
	Gui, 3: destroy
	drawString3(status_trix_x, status_trix_y, var1, 0x00ff00, status_trix_size, "", 880000)
	SoundBeep
}
return


drawString(x, y, string, color, size, Font, background)
{
	Gui, 2:destroy
	Gui, 2: -Caption +E0x80000 +LastFound +OwnDialogs +Owner +AlwaysOnTop +E0x20
    Gui, 2:Color, c%background%
    Gui, 2:Font, s%size% q1 c%color%, %Font%
    gui, 2:margin,, 0
    gui, 2:add, text,, %string%
    Gui, 2:Show, y%Y% x%X% NoActivate, ch
    WinSet, TransColor, c%background% 255
}

drawString3(x, y, string, color, size, Font, background)
{
    Gui, 3:destroy
    Gui, 3: -Caption +E0x80000 +LastFound +OwnDialogs +Owner +AlwaysOnTop +E0x20
    Gui, 3:Color, c%background%
    Gui, 3:Font, s%size% q1 c%color%, %Font%
    gui, 3:margin,, 0
    gui, 3:add, text,, %string%
    Gui, 3:Show, y%Y% x%X% NoActivate, ch
    WinSet, TransColor, c%background% 255
}
<!Esc::
ExitApp
