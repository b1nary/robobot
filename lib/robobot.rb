require "robobot/version"

module Robobot
	class << self; attr_accessor :debug; end
	@debug = false

	def self.spawn_window cmd
		require 'robobot/window'
		pipe = IO.popen(cmd)
		return Robobot::Window.new(pipe.pid.to_i)
	end
end
