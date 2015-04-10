require 'gosu'

module ZOrder
  Background, Coconuts, Hearts, Player, UI = *0..4
end

require_relative 'loveandcoconuts.rb'
require_relative 'heart.rb'
require_relative 'player.rb'

window = GameWindow.new
window.show
