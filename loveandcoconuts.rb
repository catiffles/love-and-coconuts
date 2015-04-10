class GameWindow < Gosu::Window
  def initialize
    super(500, 400, false)
    self.caption = "Love and Coconuts"

    @background_image = Gosu::Image.new(self, "images/coconutbeach.png", true)
    @message = Gosu::Image.from_text(
      self, "Love and Coconuts", Gosu.default_font_name, 30)

    @player = Gosu::Image.new(self, "images/duderight1.png", 20)
    @x = 50
    @y = 350
    @buttons_down=0
    @score = 0

    @heart_anim = Gosu::Image::load_tiles(self, "images/heart.png", 25, 25, false)
    @hearts = Array.new

    @score = Gosu::Image.from_text(self, "Score: #{@score}", Gosu.default_font_name, 20)
  end

  def update
    @x -= 1 if button_down?(Gosu::KbLeft)
    @x += 1 if button_down?(Gosu::KbRight)

    if rand(100) < 4 and @hearts.size < 2 then
      @hearts.push(Heart.new(@heart_anim))
    end
  end

  def draw
    @background_image.draw(0, 0, ZOrder::Background)
    @message.draw(250,70,50)
    @score.draw(10, 10, 10)
    @player.draw(@x, @y, 10)
    @hearts.each { |heart| heart.draw }
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end

  def collect_hearts(hearts)
    hearts.reject! do |heart|
      if Gosu::distance(@x, @y, heart.x, heart.y) < 100 then
        @score += 1
        true
      else
        false
      end
    end
  end
end
