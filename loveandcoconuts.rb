class GameWindow < Gosu::Window
  attr_accessor :state

  def initialize
    super(500, 400, false)
    $window = self
  end

  def update
    @state.update
  end

  def draw
    @state.draw
  end

  def needs_redraw?
    @state.needs_redraw?
  end

  def button_down(id)
    @state.button_down(id)
  end
end
