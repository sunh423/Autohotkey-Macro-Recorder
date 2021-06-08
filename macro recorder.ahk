SetWorkingDir % A_ScriptDir
FileEncoding, UTF-16
#Include JSON.ahk


 ; to read:
 ; IniRead, Key1, %A_ScriptFullPath%, settings, key1
 
 ; to write:
 ; IniWrite, %key1%, %A_ScriptFullPath%, settings, key1

;Check to see if the settings.ini exists, if not, create one.

memSlots := [{},{},{},{},{},{},{},{},{}]

IfNotExist, % A_ScriptDir . "\Settings.ini"
	{
		Tooltip, % "Settings.ini not detected;`n generating new file."
		SetTimer, TT, -2000
		FileAppend,
(
[General]
) , Settings.ini, UTF-16

IniWrite, True, Settings.ini, General, DelayVarianceToggle
IniWrite, 0, Settings.ini, General, MinMSDelayVariance
IniWrite, 50, Settings.ini, General, MaxMSDelayVariance
IniWrite, %A_Space%, Settings.ini, General, LastUsedSaveSlot

;CRAZY GOOD ARRAY CHECKING TOOL
;Loop % 9
;	{
;		element := memSlots[A_Index]
;		MsgBox % "Element number " . A_Index . " is " . memSlots[A_Index]
;	}

} Else {
Tooltip, # "Settings.ini successfully loaded."
SetTimer, TT, -2000
}

;Initializing parent settings.ini variables
IniRead, currentInstance, Settings.ini, General, LastUsedSaveSlot, 1
IniRead, DelayVarianceToggle, Settings.ini, General, DelayVarianceToggle
IniRead, MinMSDelayVariance, Settings.ini, General, MinMSDelayVariance
IniRead, MinMSDelayVariance, Settings.ini, General, MaxMSDelayVariance

;Initializing other parent variables
recodring := False
rewidning := False
xPosPlan := [0]
yPosPlan := [0]
timePlan := [0]
drckPlan := [0]
pos := 1

;Initializing Json Saves
Loop, 9
{
	IfNotExist, % A_ScriptDir . "\Saves\Save Slot " . A_Index . ".json"
	{
		Tooltip, % "Save Slot" . A_Index . " missing; generating new file."
		SetTimer, TT, -500
		FileAppend,, % A_ScriptDir . "\Saves\Save Slot " . A_Index . ".json"
	} else {
		FileRead, memSlot, % A_ScriptDir . "\Saves\Save Slot " . A_Index . ".json"
		parsed := JSON.Load(memSlot)
		memSlots[A_Index] := parsed
	}
}


NumpadAdd::
	global currentInstance
	global memSlots

	MsgBox, 4, , Are you sure you want to`nsave your macro recordings?
	IfMsgBox No
    	return

	hotKey, NumpadAdd, Off
	hotKey, Numpad1, Off
	hotKey, Numpad2, Off
	hotKey, Numpad3, Off
	hotKey, Numpad4, Off
	hotKey, Numpad5, Off
	hotKey, Numpad6, Off
	hotKey, Numpad7, Off
	hotKey, Numpad8, Off
	hotKey, Numpad9, Off
	hotKey, Numpad0, Off
	hotKey, NumpadDot, Off
	hotKey, NumpadEnter, Off

	Tooltip, Macro Recordings Saving`n
			 and Script Restarting...!
	SetTimer, TT, -5000

	IniWrite, %currentInstance%, Settings.ini, General, LastUsedSaveSlot ;Saves the last activate save slot

	Gui, MacroRecorder:New
	Gui, Add, Text, , Currently saving,`nplease wait...
	Gui, Show, Center, Msgbox
	Loop, 9
	{
		FileRead, memSlot, % A_ScriptDir . "\Saves\Save Slot " . A_Index . ".json"
		dumped := JSON.Dump(memSlots[A_Index])
		if (memSlot != dumped)
		{
			FileDelete, % A_ScriptDir . "\Saves\Save Slot " . A_Index . ".json"
			Sleep, 200
			FileAppend, %dumped%, % A_ScriptDir . "\Saves\Save Slot " . A_Index . ".json"
			Sleep, 200
		}
	}

	Gui, Destroy
	Reload
return

Numpad1::
	global recodring
	global rewidning
	global currentInstance

	if(recodring or rewidning)
		{
		Tooltip, Stop process before switching save slot
		SetTimer, TT, -2000
		return
	} else {
		currentInstance := 1
		Tooltip, Switched to save slot %currentInstance%
		SetTimer, TT, -2000
		}
return

Numpad2::
	global recodring
	global rewidning
	global currentInstance

	if(recodring or rewidning)
		{
		Tooltip, Stop process before switching save slot
		SetTimer, TT, -2000
		return
	} else {
		currentInstance := 2
		Tooltip, Switched to save slot %currentInstance%
		SetTimer, TT, -2000
		}
return

Numpad3::
	global recodring
	global rewidning
	global currentInstance

	if(recodring or rewidning)
		{
		Tooltip, Stop process before switching save slot
		SetTimer, TT, -2000
		return
	} else {
		currentInstance := 3
		Tooltip, Switched to save slot %currentInstance%
		SetTimer, TT, -2000
		}
return

Numpad4::
	global recodring
	global rewidning
	global currentInstance

	if(recodring or rewidning)
		{
		Tooltip, Stop process before switching save slot
		SetTimer, TT, -2000
		return
	} else {
		currentInstance := 4
		Tooltip, Switched to save slot %currentInstance%
		SetTimer, TT, -2000
		}
return

Numpad5::
	global recodring
	global rewidning
	global currentInstance

	if(recodring or rewidning)
		{
		Tooltip, Stop process before switching save slot
		SetTimer, TT, -2000
		return
	} else {
		currentInstance := 5
		Tooltip, Switched to save slot %currentInstance%
		SetTimer, TT, -2000
		}
return

Numpad6::
	global recodring
	global rewidning
	global currentInstance

	if(recodring or rewidning)
		{
		Tooltip, Stop process before switching save slot
		SetTimer, TT, -2000
		return
	} else {
		currentInstance := 6
		Tooltip, Switched to save slot %currentInstance%
		SetTimer, TT, -2000
		}
return

Numpad7::
	global recodring
	global rewidning
	global currentInstance

	if(recodring or rewidning)
		{
		Tooltip, Stop process before switching save slot
		SetTimer, TT, -2000
		return
	} else {
		currentInstance := 7
		Tooltip, Switched to save slot %currentInstance%
		SetTimer, TT, -2000
		}
return

Numpad8::
	global recodring
	global rewidning
	global currentInstance

	if(recodring or rewidning)
		{
		Tooltip, Stop process before switching save slot
		SetTimer, TT, -2000
		return
	} else{
		currentInstance := 8
		Tooltip, Switched to save slot %currentInstance%
		SetTimer, TT, -2000
		}
return

Numpad9::
	global recodring
	global rewidning
	global currentInstance

	if(recodring or rewidning)
		{
		Tooltip, Stop process before switching save slot
		SetTimer, TT, -2000
		return
	} else {
		currentInstance := 9
		Tooltip, Switched to save slot %currentInstance%
		SetTimer, TT, -2000
		}
return

Numpad0::
	global recodring
	global rewidning
	global timePlan
	global pos

	while(rewidning)
	{
		Tooltip, Unable to start recording`n please stop macro first
		SetTimer, TT, -2000
		return
	}

	recodring := true

	xPosPlan := [0]
	yPosPlan := [0]
	timePlan := [0]
	drckPlan := [0]
	pos := 1
	Tooltip, Recording Started
	SetTimer, TT, -2000
	
	while(recodring)
	{
		sleep 100
		t := timePlan[pos]
		t += 100
		timePlan[pos] := t
	}
return

NumpadDot::
	global memSlots
	global recodring
	global rewidning
	global currentInstance
	global xPosPlan ;Plan1
	global yPosPlan ;Plan2
	global timePlan ;Plan3
	global drckPlan ;Plan4
	global pos

	if(recodring)
	{
		recodring := False
		Tooltip, Recording stored
		SetTimer, TT, -2000

		;OutputDebug, % currentInstance . "`n" --> 1
		;OutputDebug, % "mem1: " . memSlots[currentInstance] --> mem1: Hello
		memSlots[currentInstance] := Object("SxPosPlan", xPosPlan, "SyPosPlan", yPosPlan, "StimePlan", timePlan, "SdrckPlan", drckPlan)
		;OutputDebug, % (memSlots[currentInstance].SxPosPlan)[1] --> 2436

	} 

	if(rewidning) 
		{
			rewidning := False

			xPosPlan := [0]
			yPosPlan := [0]
			timePlan := [0]
			drckPlan := [0]

			Tooltip, Macro Stopped
			SetTimer, TT, -2000
		}
return

NumpadEnter::
	global recodring
	global rewidning
	global currentInstance
	global xPosPlan ;Plan1
	global yPosPlan ;Plan2
	global timePlan ;Plan3
	global drckPlan ;Plan4
	global memSlots

	if(recodring)
	{
		Tooltip, Stop recording before running macro
		SetTimer, TT, -2000
		return
	}

	if(rewidning)
	{
		Tooltip, Macro already running!
		SetTimer, TT, -2000
		return
	}

	rewidning := True

	xPosPlan := memSlots[currentInstance].SxPosPlan
	yPosPlan := memSlots[currentInstance].SyPosPlan
	timePlan := memSlots[currentInstance].StimePlan
	drckPlan := memSlots[currentInstance].SdrckPlan

	Tooltip, Macro Started
	SetTimer, TT, -2000

	while(rewidning)
	{
		i := 1
		l := timePlan.length()
		while(i < l)
		{	if (rewidning != true)
				break
			t := timePlan[i]
			x := xPosPlan[i]
			y := yPosPlan[i]
			d := drckPlan[i]
			random, rand, 0, 100
			delay := rand + t
			sleep %delay%
			if(d = 1)
				click, right, %x%, %y%
			click, %x%, %y%
			i := i+1
		}
	}
return

LButton::
	;hotKey, LButton, Off

	global recodring
	global xPosPlan ;Plan1
	global yPosPlan ;Plan2
	global timePlan ;Plan3
	global drckPlan ;Plan4
	global pos

	send,{LButton down}
	if(recodring)
	{
		mouseGetPos, x, y
		xPosPlan[pos] := x
		yPosPlan[pos] := y
		drckPlan[pos] := 0
		xPosPlan.push(0)
		yPosPlan.push(0)
		drckPlan.push(0)
		timePlan.push(0)
		pos := pos + 1
	}
	
	keywait,LButton
	send,{LButton up}
	;hotKey, LButton, On
return


RButton::
	global recodring
	global xPosPlan ;Plan1
	global yPosPlan ;Plan2
	global timePlan ;Plan3
	global drckPlan ;Plan4

	send,{RButton down}
	if(recodring)
	{
		mouseGetPos, x, y
		xPosPlan[pos] := x
		yPosPlan[pos] := y
		drckPlan[pos] := 1
		xPosPlan.push(0)
		yPosPlan.push(0)
		drckPlan.push(0)
		timePlan.push(0)
		pos := pos + 1
	}
	keywait,RButton
	send,{RButton up}

	;hotKey, RButton, On
return

return
;---------------------everything below this does not autorun-------------------
TT:
ToolTip
return