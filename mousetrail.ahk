Menu, TRAY, Icon, mousetrail.ico
Menu, TRAY, Tip, Strafe-Visualizer by Swayze

#Persistent
#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#MaxThreadsPerHotkey 255
#KeyHistory 0
SetWorkingDir %A_ScriptDir%
#SingleInstance,Force
SetWinDelay,0
trail=20
delay=100

Loop
{
  Loop,%trail%
  {
    MouseGetPos,x,y
    Sleep,%delay%
	drawstring5()
	drawstring4()
	Gui,4:Show,X%x% Y1000 W20 H10 NoActivate,MouseTrail
	}
}
drawstring4()
{
	Gui,4: -Caption +E0x80000 +LastFound +OwnDialogs +Owner +AlwaysOnTop +E0x20
	Gui,4:Margin,0,0
	Gui,4:Color,00FF00
	Gui,4:Font,C00FF00 S10 W1,Wingdings
	Gui,4:Add,Text,,-
	WinSet,TransColor,FFFFFF 150,MouseTrail
}
drawstring5()
{
	var2 := (A_ScreenWidth / 2)+10
    Gui, 5: -Caption +E0x80000 +LastFound +OwnDialogs +Owner +AlwaysOnTop +E0x20
    Gui, 5:Color, c%background%
    Gui, 5:Font, s16 q1 cwhite, %Font%
    gui, 5:Margin,0,0
    gui, 5:add, text,,|
    Gui, 5:Show, y990 x%var2% NoActivate, ch
    WinSet, TransColor, c%background% 255
}
<!Esc::
ExitApp