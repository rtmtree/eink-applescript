-- Toggle grayscale
tell application "System Preferences"
	launch
	reveal anchor "Seeing_ColorFilters" of pane "Accessibility"
end tell

tell application "System Events"
	tell application process "System Preferences"
		set frontmost to true
		delay 1
		tell window "Accessibility"
			repeat until exists checkbox "Enable Color Filters" of tab group 1 of group 1
				delay 0.01
			end repeat
			click first checkbox of tab group 1 of group 1
		end tell
	end tell
end tell

-- Toggle Other Display Accessibility those are good for eink

tell application "System Preferences"
	launch
	reveal anchor "Seeing_Display" of pane "Accessibility"
end tell
tell application "System Events"
	tell application process "System Preferences"
		set frontmost to true
		delay 1
		tell window "Accessibility"
			repeat until exists checkbox "Invert colors" of tab group 1 of group 1
				delay 0.01
			end repeat
			click second checkbox of tab group 1 of group 1 -- Reduce motion
			click third checkbox of tab group 1 of group 1 -- Increase contrast
			-- click fourth checkbox of tab group 1 of group 1 -- Reduce Trans
			click fifth checkbox of tab group 1 of group 1 -- Show toolbar btn shape			
		end tell
	end tell
end tell

tell application "System Preferences" to if it is running then quit