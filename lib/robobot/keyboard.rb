# This class controls the keyboard

# Author::    Roman Pramberger (mailto:roman@pramberger.ch)
# License::   MIT

module Robobot
	class Keyboard

		# Initialize keyboard
		def initialize window = nil
			@window = window
		end

		# Press key
		#
		# You may use any Syntax like:
		#     space, Control+a, A, up, alt+r, 
		#     BackSpace, Control, Control_R, shift, super, ...
		#
		def key key
			cmd "key #{key}"
		end

		# Key down only
		def keydown key
			cmd "keydown #{key}"
		end

		# Key up
		def keyup key
			cmd "keyup #{key}"
		end

		# type text
		def type text
			cmd "type \"#{text}\""
		end

		private

		# Command generator (add window if set)
		def cmd command
			command = command.split(" ",2)
			cmd = "xdotool #{command[0]}"
			cmd += " --window #{@window.id}" if @window
			cmd += " #{command[1]}"
			puts "#{cmd}"
			`#{cmd}`
		end

	end
end