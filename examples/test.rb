require 'robobot'
require "robobot/window"
require "robobot/notification"
require "robobot/keyboard"
require "robobot/mouse"
require "robobot/workspaces"

Robobot.debug = true

Robobot::Notification.show "Select a window", :timeout => 500
Robobot::Notification.beep :frequency => 150, :length => 100

window = Robobot::Window.new :click
puts "Window name:\t#{window.name}"
puts "Window geo :\t#{window.geometry}"

# set size may bugs if not hidden
window.hide
window.set_size 1920, 500
window.show
window.set_position 0, 0
window.raise
window.focus
# window.kill

# Test keyboard
keyboard = Robobot::Keyboard.new window
10.times do
keyboard.key "space"
end

# Test mouse
mouse = Robobot::Mouse.new window
mouse.click
sleep 1
mouse.move 100, 100
mouse.click 3
sleep 0.5
mouse.move 80, 80
mouse.down
sleep 0.2
mouse.up
mouse.click

# Test workspaces
puts "Workspaces: #{Robobot::Workspaces.count}"
Robobot::Workspaces.count 4
puts "Workspaces: #{Robobot::Workspaces.count}"

puts "Current: #{Robobot::Workspaces.current}"
Robobot::Workspaces.current 2
sleep 0.5

puts "Window is on: #{Robobot::Workspaces.get_workspace(window)}"
Robobot::Workspaces.move window, 2
puts "Window is now on: #{Robobot::Workspaces.get_workspace(window)}"

window.focus
sleep 1
Robobot::Workspaces.move window, 0
window.focus
