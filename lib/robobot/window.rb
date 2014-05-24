# This class handles the window on which the commands are used
# Its fully optional, if now window is defined it will use
# the current active one.

# Author::    Roman Pramberger (mailto:roman@pramberger.ch)
# License::   MIT

module Robobot
	class Window
		@window

		# Gets a window by process name (string) or process id (integer)
		# you may also use :current to use the current active one
		# or use :click to request clicking the window
		def initialize name_or_pid
			if name_or_pid == :current
				@window = `xdotool getwindowfocus`.chomp
			elsif name_or_pid == :click
				@window = `xdotool selectwindow`.chomp
			elsif name_or_pid.is_a? String
				@window = `xdotool search #{name_or_pid} | head -1`.chomp
			elsif name_or_pid.is_a? Integer
				@window = `xdotool search --pid #{name_or_pid}`.chomp
			else
				raise 'Not a valid window value'
			end
			if Robobot.debug
				puts "Window selected: #{@window}" 
			end
		end

		# Return window id
		def id
			@window
		end

		# Return a windows name
		def name
			return `xdotool getwindowname #{@window}`.chomp
		end

		# Return window geometry
		def geometry
			geo = `xdotool getwindowgeometry #{@window}`.chomp.split("\n")
			xy = geo[1].split(": ")[1].split(" ")[0].split(",")
			screen = geo[1].split("(")[1].split(": ")[1].split(")")[0]
			wh = geo[2].split(": ")[1].chomp.split("x")
			out = { 
				:x => xy[0].to_i, 
				:y => xy[1].to_i,
				:screen => screen.to_i,
				:width => wh[0].to_i,
				:height => wh[1].to_i
			}
			return out
		end

		# Set window size
		def set_size width, height
			`xdotool windowsize #{@window} #{width} #{height}`
			puts "xdotool windowsize #{@window} #{width} #{height}" if Robobot.debug
		end

		# Set window position
		def set_position x, y
			`xdotool windowmove #{@window} #{x} #{y}`
			puts "xdotool windowmove #{@window} #{x} #{y}" if Robobot.debug
		end

		# Hide window
		def hide
			`xdotool windowunmap #{@window}`
			puts "xdotool windowunmap #{@window}" if Robobot.debug
		end

		# Show window
		def show
			`xdotool windowmap #{@window}`
			puts "xdotool windowmap #{@window}" if Robobot.debug
		end

		# Raise window to the front
		def raise
			`xdotool windowraise #{@window}`
			puts "xdotool windowraise #{@window}" if Robobot.debug
		end

		# Focus the window
		def focus
			# may work better than windowfocus, also switches workspaces
			`xdotool windowactivate --sync #{@window}`
			puts "xdotool windowactivate --sync #{@window}" if Robobot.debug
		end

		# Kill window
		def kill
			`xdotool windowkill #{@window}`
			puts "xdotool windowkill #{@window}" if Robobot.debug
		end
	end
end