require 'java'
require 'keys'

java_import javax.sound.midi.MidiSystem

synth = MidiSystem.synthesizer
synth.open
channel = synth.channels[0]

frame = javax.swing.JFrame.new "Music Frame"
frame.set_size 600, 100
frame.layout = java.awt.FlowLayout.new

KEYS.each do |value, char|
  button = javax.swing.JButton.new char
  button.add_action_listener { |e| channel.note_on value, 99 }
  frame.add button
end

frame.visible = true

## For IRB demos just type:
# synth.close

## Otherwise, this code just cleans up the synth on exit/window close
frame.default_close_operation = frame.class::EXIT_ON_CLOSE
frame.add_window_listener(java.awt.event.WindowListener.impl {|m,*a| synth.close if m == :windowClosing })
