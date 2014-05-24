# This module helps controling workspaces

# Author::    Roman Pramberger (mailto:roman@pramberger.ch)
# License::   MIT

module Robobot
	module Workspaces

		# Get or Set current workspace count
		def self.count num = nil
			if num.nil?
				return `xdotool get_num_desktops`
			else
				`xdotool set_num_desktops #{num}`
			end
		end

		# Get or Set current workspace
		def self.current workspace = nil
			if workspace.nil?
				return `xdotool get_desktop`
			else
				`xdotool set_desktop #{workspace}`
			end
		end

		# Move window to workspace
		def self.move window, workspace
			`xdotool set_desktop_for_window #{window.id} #{workspace}`
		end

		# Get workspace of window
		def self.get_workspace window
			`xdotool get_desktop_for_window #{window.id}`
		end

	end
end