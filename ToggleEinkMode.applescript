-- Toggle grayscale

-- tell application "System Preferences"
--	launch
--	reveal anchor "Seeing_ColorFilters" of pane "Accessibility"
-- end tell

-- tell application "System Events"
--	tell application process "System Preferences"
--		set frontmost to true
--		delay 1
--		tell window "Accessibility"
--			repeat until exists checkbox "Enable Color Filters" of tab group 1 of group 1
--				delay 0.01
--			end repeat
--			click first checkbox of tab group 1 of group 1
--		end tell
--	end tell
-- end tell

-- Toggle Other Display Accessibility those are good for eink, for Monterey

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
			click fifth checkbox of tab group 1 of group 1 -- Show toolbar btn shape
			
			set IncreaseContrast to third checkbox of tab group 1 of group 1
			click IncreaseContrast
			-- Click ReduceTrans when IncreaseContrast is not checked
			set ReduceTrans to fourth checkbox of tab group 1 of group 1
			tell IncreaseContrast
				if not (its value as boolean) then click ReduceTrans
			end tell
		end tell
	end tell
end tell
tell application "System Preferences" to if it is running then quit


-- Toggle Other Display Accessibility those are good for eink, for Sonoma

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
		set ReduceMotion to checkbox "Reduce motion" of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Display" of application process "System Settings" of application "System Events"
		set IncreaseContrast to checkbox "Increase contrast" of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Display" of application process "System Settings" of application "System Events"
		set DiffWithoutColor to checkbox "Differentiate without color" of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Display" of application process "System Settings" of application "System Events"
		set ReduceTrans to checkbox "Reduce Transparency" of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Display" of application process "System Settings" of application "System Events"
		click ReduceMotion
		click IncreaseContrast
		click DiffWithoutColor
		-- click ReduceTrans
	end tell
end tell
tell application "System Settings" to quit




-- Toggle Light Theme

tell application "System Events"
	tell appearance preferences
		set dark mode to not dark mode
	end tell
end tell