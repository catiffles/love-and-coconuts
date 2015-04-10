class GameWindow < Gosu::Window
  def initialize
    super(500, 400, false)
    self.caption = "Love and Coconuts"

    @background_image = Gosu::Image.new(self, "images/coconutbeach.png", true)
    @message = Gosu::Image.from_text(
      self, "Love and Coconuts", Gosu.default_font_name, 30)

    @player = Player.new(self)
    @player.warp(50, 350)

    @heart_anim = Gosu::Image::load_tiles(self, "images/heart.png", 25, 25, false)
    @hearts = Array.new

    @coconut_anim = Gosu::Image::load_tiles(self, "images/coconut.png", 25, 25, false)
    @coconuts = Array.new

    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
  end

  def update
    @player.walkleft if button_down?(Gosu::KbLeft)
    @player.walkright if button_down?(Gosu::KbRight)
    @player.collect_hearts(@hearts)
    @player.hit_by_coconut(@coconuts)

    if rand(100) < 4 and @hearts.size < 2 then
      @hearts.push(Heart.new(@heart_anim))
    end

    if rand(100) < 4 then
      @coconuts.push(Coconut.new(@coconut_anim))
    end

  end

  def draw
    @background_image.draw(0, 0, ZOrder::Background)
    @message.draw(250,70,50)
    @font.draw("Score: #{@player.score}", 10, 10, ZOrder::UI)
    @font.draw("Lives Left: #{@player.lives}", 20, 20, ZOrder::UI)
    @player.draw
    @hearts.each { |heart| heart.draw }
    @coconuts.each { |coconut| coconut.draw
      coconut.drop
    }
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end
end
