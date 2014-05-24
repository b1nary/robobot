# Notifications help to show results and information to the user
# It uses: libnotify

# Author::    Roman Pramberger (mailto:roman@pramberger.ch)
# License::   MIT

module Robobot
	module Notification

		# show a notification
		# you must define a title
		#
		# Parameter
		#    title:    required title
		#    options:  see below
		#
		# Options
		#    :msg      optional message
		#    :icon     icon path
		#    :urgency  low, normal or critical
		#    :time     time in milliseconds
		#
		def self.show title, options
			cmd = "notify-send \"#{title}\""
			cmd += " \"#{options[:msg]}\"" if !options[:msg].nil?
			cmd += " -i #{options[:icon]}" if !options[:icon].nil?
			cmd += " -u #{options[:urgency]}" if !options[:urgency].nil?
			cmd += " -t #{options[:timeout]}" if !options[:timeout].nil?
			`#{cmd}`
			puts cmd if Robobot.debug
		end

		# beeping :)
		# in order to make it work you have to:
		#     modprobe pcspkr
		#
		# Parameter
		#    options:   see below
		#
		# Options
		#    :frequency
		#    :length
		#    :repeat
		#    :delay
		#
		def self.beep options
			cmd = "beep"
			cmd += " -f #{options[:frequency]}" if !options[:frequency].nil?
			cmd += " -l #{options[:length]}" if !options[:length].nil?
			cmd += " -r #{options[:repeat]}" if !options[:repeat].nil?
			cmd += " -D #{options[:delay]}" if !options[:delay].nil?
			`beep`
			puts cmd if Robobot.debug
		end

	end
end