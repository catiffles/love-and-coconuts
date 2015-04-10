class Heart
  attr_reader :x, :y

  def initialize(animation)
    @animation = animation
    @x = rand * 500
    @y = 375
  end

  def draw
    img = @animation[Gosu::milliseconds / 100 % @animation.size]
    img.draw(@x - img.width / 2.0, @y - img.height / 2.0, ZOrder::Hearts)
  end
end

#Collect hearts for points
