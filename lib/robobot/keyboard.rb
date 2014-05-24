module Robobot

	class Keyboard

		# Initialize keyboard
		def initialize window
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

		private

		# Command generator (add window if set)
		def cmd command
			cmd = "xdotool #{cmd}"
			cmd += " --window #{@window.id}" if @window
			puts "#{cmd}"
			`#{cmd}`
		end

	end

end