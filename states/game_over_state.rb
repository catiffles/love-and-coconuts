class GameOverState < GameState
  def initialize
    @ouch = Gosu::Image.from_text($window, "Got hit by too many coconuts!", Gosu.default_font_name, 40)
    @over = Gosu::Image.from_text($window, "Game Over!", Gosu.default_font_name, 50)
  end

  def draw
    @ouch.draw(10, 100, 20)
    @over.draw(140, 175, 20)
  end

  def button_down(id)
    if id == Gosu::KbEscape
      GameState.switch(MenuState.instance)
    end
  end
end
