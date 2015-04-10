class Coconut
  attr_reader :x

  def initialize(animation)
    @animation = animation
    @x = rand * 500
  end

  def draw
    img = @animation[Gosu::milliseconds / 100 % @animation.size]
    img.draw(@x - img.width / 2.0, 375, ZOrder::Coconuts)
  end
end

#make coconuts fall from the sky :D
