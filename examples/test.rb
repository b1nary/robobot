require 'robobot'
require "robobot/window"
require "robobot/notification"
require "robobot/keyboard"
require "robobot/mouse"

Robobot.debug = true

Robobot::Notification.show "Select a window", :timeout => 500
Robobot::Notification.beep :frequency => 150, :length => 100

window = Robobot::Window.new :click
puts "Window name:\t#{window.name}"
puts "Window geo :\t#{window.geometry}"

# set size may bugs if not hidden
window.hide
window.set_size 1920, 200
window.show
window.set_position 0, 0
window.raise
window.focus
# window.kill

keyboard = Robobot::Keyboard.new window
100.times do
keyboard.key "space"
end

mouse = Robobot::Mouse.new window
mouse.click
sleep 1
mouse.move 100, 100
mouse.click 3
sleep 0.5
mouse.move 100, 10
mouse.down
sleep 0.5
mouse.up