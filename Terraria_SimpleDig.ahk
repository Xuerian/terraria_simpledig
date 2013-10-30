/* 
Hold Ctrl to left click constantly
Hold Ctrl+F in a direction to mine a simple 2x (Vertical) or 3x (Horizontal) tunnel
Add Shift to go slower to mine tougher blocks
Adjust Delay (Milliseconds) to your current pick. (25 is for picksaw)
Adjust SlowMultiplier to adjust how much to slow down

Why? I don't want to develop RSI any earlier than I have to.
*/

DigKey := "f"
Delay := 25
SlowMultiplier := 6
Modifier := "LCtrl"
SlowModifier := "LShift"

#IfWinActive, Terraria:
Hotkey, %Modifier%, TheAction

TheAction:
	While GetKeyState(Modifier, "P") {
		Click down
		if (GetKeyState(DigKey, "P")) {
			WinGetPos , , , winWidth, winHeight, A
			MouseGetPos mouseX, mouseY
			midX := winWidth/2
			midY := winHeight/2
			if (abs(midX - mouseX) > abs(midY - mouseY)) {
				if (midX > mouseX) {
					startX := midX - 22
					startY := midY + 28
				} else {
					startX := midX + 18
					startY := midY + 28
				}
				MouseMove startX, startY
				while GetKeyState(DigKey, "P") {
					LoopDelay := GetKeyState(SlowModifier, "P") ? Delay * 6 : Delay
					MouseMove startX, startY - 15, 2
					Sleep LoopDelay
					MouseMove startX, startY - 30, 2
					Sleep LoopDelay
					MouseMove startX, startY, 2
					Sleep LoopDelay
				}
			} else {
				if (midY > mouseY) {
					startX := midX - 9
					startY := midY - 25
				} else {
					startX := midX - 9
					startY := midY + 38
				}
				MouseMove startX, startY
				while GetKeyState(DigKey, "P") {
					LoopDelay := GetKeyState(SlowModifier, "P") ? Delay * 6 : Delay
					MouseMove startX + 15, startY, 2
					Sleep LoopDelay
					MouseMove startX, startY, 2
					Sleep LoopDelay
				}
			}
		}
		Click up
		sleep 5
	}
return