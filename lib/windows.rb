class StartWindow < Gosu::Window
	def initialize
		@width = 600
		@height = 400
		super(@width, @height, false)
		@player = Player.new(self)
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
