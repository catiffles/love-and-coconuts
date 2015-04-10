require 'singleton'

class MenuState < GameState
  include Singleton
  attr_accessor :play_state

  def initialize
    @message = Gosu::Image.from_text($window, "Love and Coconuts", Gosu.default_font_name, 40)
    @info = Gosu::Image.from_text($window, "N = New Game", Gosu.default_font_name, 30)
  end

  def draw
    @message.draw($window.width / 2 - @message.width / 2, $window.height / 2 - @message.width / 2 + 20, 10)
    @info.draw($window.width / 2 - @info.width / 2, $window.height / 2 - @info.height / 2 + 100, 10)
  end

  def button_down(id)
    $window.close if id == Gosu::KbEscape
    if id == Gosu::KbN
      @play_state = PlayState.new
      GameState.switch(@play_state)
    end
  end
end
