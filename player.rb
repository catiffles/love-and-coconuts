class Player
  attr_reader :score, :lives

  def initialize
    @image = Gosu::Image.new($window, "images/dudeleft1.png", false)
    @x = @y = 0
    @score = 0
    @lives = 3
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def walkleft
    @x -= 1
  end

  def walkright
    @x += 1
  end

  def draw
    @image.draw(@x, @y, ZOrder::Player)
  end

  def collect_hearts(hearts)
    hearts.reject! do |heart|
      if Gosu::distance(@x, @y, heart.x, heart.y) < 35 then
        @score += 1
        true
      else
        false
      end
    end
  end

  def hit_by_coconut(coconuts)
    coconuts.reject! do |coconut|
      if Gosu::distance(@x, @y, coconut.x, coconut.y) < 10 then
        @lives -= 1
        true
      else
        false
      end
    end
  end
end
