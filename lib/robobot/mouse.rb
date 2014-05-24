# This class controls the mouse

# Author::    Roman Pramberger (mailto:roman@pramberger.ch)
# License::   MIT

module Robobot
	class Mouse

		# Initialize mouse
		def initialize window = nil
			@window = window
		end

		# Move mouse to x,y
		def move x,y
			cmd "mousemove --sync #{x} #{y}"
		end

		# Move relative to current position
		def move_relative x,y
			cmd "mousemove_relative --sync #{x} #{y}"
		end

		# Click
		#
		# Buttons:
		#    1 = Left
		#    2 = Middle
		#    3 = Right
		#    4 = Wheel up
		#    5 = Wheel down
		#
		def click button = "1"
			cmd "click #{button}"
		end

		# Mouse down (see Click)
		def down button = "1"
			cmd = "mousedown #{button}"
		end

		# Mouse up (see Click)
		def up button = "1"
			cmd = "mousedown #{button}"
		end

		# Get location
		def location
			location = `xdotool getmouselocation --shell`.split("\n")
			return {
				:x => location[0].split("=")[1],
				:y => location[1].split("=")[1],
				:screen => location[2].split("=")[1],
				:window => location[3].split("=")[1]
			}
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