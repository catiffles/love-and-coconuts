require 'gosu'

module ZOrder
  Background, Coconuts, Player, Hearts, UI = *0..3
end

require_relative 'loveandcoconuts.rb'
require_relative 'heart.rb'

window = GameWindow.new
window.show
