require_relative '../heart.rb'
require_relative '../player.rb'
require_relative '../coconut.rb'

class PlayState < GameState

  def initialize

    @background_image = Gosu::Image.new($window, "images/coconutbeach.png", true)
    @message = Gosu::Image.from_text(
      $window, "Love and Coconuts", Gosu.default_font_name, 30)

    @player = Player.new
    @player.warp(50, 350)

    @heart_anim = Gosu::Image::load_tiles($window, "images/heart.png", 25, 25, false)
    @hearts = Array.new

    @coconut_anim = Gosu::Image::load_tiles($window, "images/coconut.png", 25, 25, false)
    @coconuts = Array.new

    @font = Gosu::Font.new($window, Gosu::default_font_name, 20)
  end

  def update
    @player.walkleft if $window.button_down?(Gosu::KbLeft)
    @player.walkright if $window.button_down?(Gosu::KbRight)
    @player.collect_hearts(@hearts)
    @player.hit_by_coconut(@coconuts)

    if rand(100) < 4 and @hearts.size < 2 then
      @hearts.push(Heart.new(@heart_anim))
    end

    if rand(100) < 4 then
      @coconuts.push(Coconut.new(@coconut_anim))
    end

    if @player.lives == 0 then
      @play_state = GameOverState.new
      GameState.switch(@play_state)
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
    if id == Gosu::KbEscape
      GameState.switch(MenuState.instance)
    end
  end
end
