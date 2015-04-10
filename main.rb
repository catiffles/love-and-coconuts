require 'gosu'

module ZOrder
  Background, Coconuts, Hearts, Player, UI = *0..4
end

require_relative 'loveandcoconuts.rb'

require_relative 'states/game_state'
require_relative 'states/menu_state'
require_relative 'states/play_state'
require_relative 'states/game_over_state'

$window = GameWindow.new
GameState.switch(MenuState.instance)
$window.show
