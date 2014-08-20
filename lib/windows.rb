class StartWindow < Gosu::Window
	def initialize(width, height)
		@width = width
		@height = height
		super(@width, @height, false)
		@font = Gosu::Font.new(self, Gosu::default_font_name, 20)
	end

	def update
	end

	def draw
		text = "Hello!"
		x = @width / 2.0 - (@font.text_width(text) / 2.0)
		y = @height / 3.0 - (@font.height / 2.0)
		@font.draw(text, x, y, ZOrder::UI, 1, 1, 0xffffffff)
	end
end

class GameWindow < Gosu::Window
	def initialize(width, height)
		@width = width
		@height = height
		super(@width, @height, false)
		@player = Player.new(self)
	end

	def update
		@player.update
	end

	def draw
		@player.draw
	end

	def button_down(id)
		case id
		when Gosu::KbRight
			@player.walk(:right)
		when Gosu::KbLeft
			@player.walk(:left)
		when Gosu::KbUp
			@player.walk(:up)
		when Gosu::KbDown
			@player.walk(:down)
		end
	end
end
