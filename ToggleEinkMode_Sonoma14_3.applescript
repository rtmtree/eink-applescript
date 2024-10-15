-- Toggle Other Display Accessibility those are good for eink

tell application "System Settings"
	reveal pane id "com.apple.Accessibility-Settings.extension"
	delay 0.5
	reveal anchor "Display" of pane id "com.apple.Accessibility-Settings.extension"
	delay 0.5
	activate
	delay 0.5
end tell

tell application "System Events"
	tell window 1 of application process "System Settings"
		get entire contents
		set ReduceMotion to checkbox "Reduce motion" of group 1 of scroll area 1 of group 1 of list 2 of splitter group 1 of list 1 of window "Display" of application process "System Settings" of application "System Events"
		
		
		set IncreaseContrast to checkbox "Increase contrast" of group 1 of scroll area 1 of group 1 of list 2 of splitter group 1 of list 1 of window "Display" of application process "System Settings" of application "System Events"
		set DiffWithoutColor to checkbox "Differentiate without color" of group 1 of scroll area 1 of group 1 of list 2 of splitter group 1 of list 1 of window "Display" of application process "System Settings" of application "System Events"
		set ReduceTrans to checkbox "Reduce Transparency" of group 1 of scroll area 1 of group 1 of list 2 of splitter group 1 of list 1 of window "Display" of application process "System Settings" of application "System Events"
		tell IncreaseContrast
			if false then click ReduceTrans
		end tell
		-- click ReduceTrans
		click ReduceMotion
		click IncreaseContrast
		click DiffWithoutColor
		tell IncreaseContrast
			if true then click ReduceTrans
		end tell
		
	end tell
end tell
tell application "System Settings" to quit

-- Toggle Light Theme works for most version

tell application "System Events"
	tell appearance preferences
		set dark mode to not dark mode
	end tell
end tell