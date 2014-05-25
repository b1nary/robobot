require "robobot/version"

module Robobot
	class << self; attr_accessor :debug; end
	@debug = false
end
