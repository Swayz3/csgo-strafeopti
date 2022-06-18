toggle_null_key = PgDn
toggle_ms_key = left
keywait_up = Up
keywait_down = Down
toggle_autohop_key = Right
spotify_int = Numpad0
sleep_time = 2000
Var1 := 1
var2 := Round(var1*1)
show_status = 1 ; 1=yes 0=no (Fulscreenwindowed only!)
var6 := .06
;######################################## - Status Options
status_as_x = 255
status_as_y = 8
status_as_size = 16 ; Font size
status_as_text = Strafe Optimize ; Displayed Text
;########################################
status_ms_x = 150
status_ms_y = 8
status_ms_size = 16 ; Font size
status_ms_text = All Strafe ; Displayed Text
;########################################
status_trix_x = 410
status_trix_y = 8
status_trix_size = 16 ; Font size
status_trix_text =  ; Displayed Text
;########################################
status_spot_x = 620
status_spot_y = 8
status_spot_size = 16 ; Font size
status_spot_text = Auto Hop ; Displayed Text
;######################################## - Code
status_autohop_x = 450
status_autohop_y = 8
status_autohop_size = 16 ; Font size
status_autohop_text = Auto Hop ; Displayed Text
status_font =  ; Leave blank for default
;######################################## -
toggle = 1
screenmid := A_ScreenWidth / 2
var5 = 0
;#####################################
Loop
{
#Persistent
#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#MaxThreadsPerHotkey 255
#KeyHistory 0
#InstallKeybdHook
SetWorkingDir %A_ScriptDir%
SendMode Input

screenmid := A_ScreenWidth / 2
drawString(status_as_x, status_as_y, status_as_text, 0xff0000, status_as_size, "", 880000)
drawString3(status_trix_x, status_trix_y, var2, 0x00ff00, status_trix_size, "", 880000)
drawString6(status_ms_x, status_ms_y, status_ms_text, 0xff0000, status_ms_size, "", 880000)
drawString7(status_autohop_x, status_autohop_y, status_autohop_text, 0xff0000, status_autohop_size, "", 880000)

Hotkey, ~$*%toggle_null_key%, toggle_as
{
toggle = 0
SendInput {blind}{d up}
SendInput {blind}{a up}
}

Hotkey, ~$*%toggle_ms_key%, toggle_ms
{
togglems = 0
SendInput {blind}{d up}
SendInput {blind}{a up}
}

Hotkey, ~$*%toggle_autohop_key%, toggle_autohop_as
{
toggle_autohop = 0
}

Hotkey, ~$*%spotify_int%, toggle_spotify
{
DetectHiddenWindows, On
WinGet, id, list, ahk_exe  Spotify.exe
this_ID := id%A_Index%
WinGetTitle, clipboard, ahk_id %this_ID%
DetectHiddenWindows, Off
toggle_spot = 0
var3 := clipboard
drawString5(status_spot_x, status_spot_y, var3, 0x00ff00, status_spot_size, "", 008800)
}

return

toggle_as:
if(toggle==1)
{
	toggle = 0
	if(show_status == 1)
	{
		SendInput {blind}{d up}
		SendInput {blind}{a up}
		drawString(status_as_x, status_as_y, status_as_text, 0xff0000, status_as_size, "", 880000)
		Gui, 3:destroy
		SoundBeep
	}
}
else
{
	toggle = 1
	if(show_status == 1)
	{
		drawString(status_as_x, status_as_y, status_as_text, 0x00ff00, status_as_size, "", 008800)
		SoundBeep
	}
}
return

toggle_ms:
if(togglems==1)
{
	togglems = 0
	if(show_status == 1)
	{
		SendInput {blind}{d up}
		SendInput {blind}{a up}
		drawString6(status_ms_x, status_ms_y, status_ms_text, 0xff0000, status_ms_size, "", 880000)
		SoundBeep
	}
}
else
{
	togglems = 1
	if(show_status == 1)
	{
		drawString6(status_ms_x, status_ms_y, status_ms_text, 0x00ff00, status_ms_size, "", 008800)
		SoundBeep
	}
}
return

key_wait_up:
if(toggle==1)
	{
		drawString3(status_trix_x, status_trix_y, var2, 0x00ff00, status_trix_size, "", 880000)
		SoundBeep
	}
return
key_wait_down:
if(toggle==1)
	{
		drawString3(status_trix_x, status_trix_y, var2, 0x00ff00, status_trix_size, "", 880000)
		SoundBeep
	}
return

toggle_autohop_as:
if(toggle_autohop==1)
{
	toggle_autohop = 0
	if(show_status == 1)
	{
		drawString7(status_autohop_x, status_autohop_y, status_autohop_text, 0xff0000, status_autohop_size, "", 880000)
		SoundBeep
	}
}
else
{
	toggle_autohop = 1
	if(show_status == 1)
	{
		drawString7(status_autohop_x, status_autohop_y, status_autohop_text, 0x00ff00, status_autohop_size, "", 008800)
		SoundBeep
	}
}
return

toggle_spotify:
if(toggle_spot==1)
{
	toggle_spot = 0
	if(show_status == 1)
	{
		var4 := 0
		Gui, 5:Destroy
		SoundBeep
		Reload
	}
}
else
{
	toggle_spot = 1
	if(show_status == 1)
	{
	var4 := 1
	drawString5(status_spot_x, status_spot_y, var3, 0x00ff00, status_spot_size, "", 008800)
	SoundBeep
	}
}
return

;~$*Shift::
;while(GetKeyState("shift", "p"))
;{
;	MouseGetPos, MX,MY, ,
;	MouseMove, -1, 0, 100
;}

return

~$*Space::
While GetKeyState("Space", "P")
{
	if(toggle_autohop== 0)
		{
			break
		}
	else
	{
		Send {blind}{Space Down}
		KeyWait, space, u, t%var6%
		Send {blind}{Space UP}
		sleep 20

	}
}
return

~$*WheelUp::
var5 += 1
if (var5 >= var1)
{
	if (toggle == 1)
	{
		if GetKeyState("a", "P")
		{
			break
		}
		if GetKeyState("d", "P")
		{
			break
		}
		MouseGetPos, x
		if (x>screenmid)
		{
			SendInput {d}
		}
		else if (x<screenmid)
		{
			SendInput {a}
		}
	var5 := 0
	}
}
return

~$*WheelDown::
var5 += 1
if (var5 >= var1)
{
	if (toggle == 1)
	{
		if GetKeyState("a", "P")
		{
			break
		}
		if GetKeyState("d", "P")
		{
			break
		}
		MouseGetPos, x
		if (x>screenmid)
		{
			SendInput {d}
		}
		else if (x<screenmid)
		{
			SendInput {a}
		}
	var5 := 0
	}
}
return

~$*d Up::
	if (togglems == 1)
	{
		if GetKeyState("a", "P")
		{
			break
		}
		else
		{
			SendInput {blind}{a down}
		}
	}
return

~$*a Up::
	if (togglems == 1)
	{
		if GetKeyState("d", "P")
		{
			break
		}
		else
		{
			SendInput {blind}{d down}
		}
	}


~$*d::
while GetKeyState("d", "P")
{
	if (toggle == 1)
	{
		if GetKeyState("a", "P")
		{
			break
		}
		else
		{
			SendInput {blind}{d down}
			KeyWait, a, d, t%var6%
			SendInput {blind}{d up}
		}
	}
}
return

~$*a::
while GetKeyState("a", "P")
{
	if (toggle == 1)
	{
		if GetKeyState("d", "P")
		{
			break
		}
		else
		{
			SendInput {blind}{a down}
			KeyWait, d, d, t%var6%
			SendInput {blind}{a up}
		}
	}
}
return

~$*up::
while(GetKeyState("up", "p"))
{
	var1 += .001
	var2 += 1
	Gui, 3: destroy
	drawString3(status_trix_x, status_trix_y, var2, 0x00ff00, status_trix_size, "", 880000)
	SoundBeep

}
return

~$*down::
while(GetKeyState("down", "p"))
{
	var1 -= .001
	var2 -= 1
	Gui, 3: destroy
	drawString3(status_trix_x, status_trix_y, var2, 0x00ff00, status_trix_size, "", 880000)
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
drawString4(x, y, string, color, size, Font, background)
{
    Gui, 4:destroy
    Gui, 4: -Caption +E0x80000 +LastFound +OwnDialogs +Owner +AlwaysOnTop +E0x20
    Gui, 4:Color, c%background%
    Gui, 4:Font, s%size% q1 c%color%, %Font%
    gui, 4:margin,, 0
    gui, 4:add, text,, %string%
    Gui, 4:Show, y%Y% x%X% NoActivate, ch
    WinSet, TransColor, c%background% 255
}
drawString7(x, y, string, color, size, Font, background)
{
    Gui, 7:destroy
    Gui, 7: -Caption +E0x80000 +LastFound +OwnDialogs +Owner +AlwaysOnTop +E0x20
    Gui, 7:Color, c%background%
    Gui, 7:Font, s%size% q1 c%color%, %Font%
    gui, 7:margin,, 0
    gui, 7:add, text,, %string%
    Gui, 7:Show, y%Y% x%X% NoActivate, ch
    WinSet, TransColor, c%background% 255
}
drawString5(x, y, string, color, size, Font, background)
{
    Gui, 5:destroy
    Gui, 5: -Caption +E0x80000 +LastFound +OwnDialogs +Owner +AlwaysOnTop +E0x20
    Gui, 5:Color, c%background%
    Gui, 5:Font, s%size% q1 c%color%, %Font%
    gui, 5:margin,, 0
    gui, 5:add, text,, %string%
    Gui, 5:Show, y%Y% x%X% NoActivate, ch
    WinSet, TransColor, c%background% 255
}

drawString6(x, y, string, color, size, Font, background)
{
    Gui, 6:destroy
    Gui, 6: -Caption +E0x80000 +LastFound +OwnDialogs +Owner +AlwaysOnTop +E0x20
    Gui, 6:Color, c%background%
    Gui, 6:Font, s%size% q1 c%color%, %Font%
    gui, 6:margin,, 0
    gui, 6:add, text,, %string%
    Gui, 6:Show, y%Y% x%X% NoActivate, ch
    WinSet, TransColor, c%background% 255
}
return

<!Esc::
ExitApp
}