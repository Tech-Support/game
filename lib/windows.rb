class StartWindow < Gosu::Window
	def initialize(width, height)
		@width = width
		@height = height
		super(@width, @height, false)
		@menu_items = %w[Start Help Options]
		@selected_index = 0
	end

	def update
	end

	def draw
		font = Gosu::Font.new(self, Gosu::default_font_name, 45)
		title = "Hello!"
		x = @width / 2.0 - (font.text_width(title) / 2.0)
		y = @height * (5/12.0) - font.height
		font.draw(title, x, y, ZOrder::UI, 1, 1, 0xffffffff)

		font = Gosu::Font.new(self, Gosu::default_font_name, 20)
		@menu_items.each_with_index do |text, i|
			x = @width / 2.0 - (font.text_width(text) / 2.0)
			y = @height * (7/12.0) - (font.height / 2.0)
			y += (font.height + 10) * i
			selected = text == @menu_items[@selected_index % @menu_items.size]
			color = (selected ? 0xffffff00 : 0xffffffff)
			font.draw(text, x, y, ZOrder::UI, 1, 1, color)
		end
	end

	def button_down(id)
		case id
		when Gosu::KbDown
			@selected_index += 1
		when Gosu::KbUp
			@selected_index -= 1
		when 36 # Gosu::KbEnter should work, but it doesn't, I think it's 88 
			selected = @menu_items[@selected_index % @menu_items.size]
			case selected
			when @menu_items[0]
				close
				game_win = GameWindow.new(@width, @height)
				game_win.show
			end
		else
			puts id
		end
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
