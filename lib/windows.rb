class Menu
	attr_accessor :items, :index

	def initialize(window, items, font, spacing = 10)
		@window = window
		@items = items
		@font = font
		@spacing = spacing
		@index = 0
	end

	def selected_item
		@items[@index % @items.size]
	end

	def draw
		@items.each_with_index do |text, i|
			x = @window.width / 2.0 - (@font.text_width(text) / 2.0)
			y = @window.height * (7/12.0) - (@font.height / 2.0)
			y += (@font.height + @spacing) * i
			selected = text == selected_item
			color = (selected ? 0xffffff00 : 0xffffffff)
			@font.draw(text, x, y, ZOrder::UI, 1, 1, color)
		end
	end
end

class Gosu::Window
	def needs_cursor?
		true
	end
end

class StartWindow < Gosu::Window
	def initialize(width, height)
		@width = width
		@height = height
		super(@width, @height, false)
		@menu = Menu.new(self, %w[Start Help Options], Gosu::Font.new(self, Gosu::default_font_name, 20))
	end

	def update
	end

	def draw
		font = Gosu::Font.new(self, Gosu::default_font_name, 45)
		title = "Hello!"
		x = @width / 2.0 - (font.text_width(title) / 2.0)
		y = @height * (5/12.0) - font.height
		font.draw(title, x, y, ZOrder::UI, 1, 1, 0xffffffff)
		@menu.draw
	end

	def button_down(id)
		case id
		when Gosu::KbDown
			@menu.index += 1
		when Gosu::KbUp
			@menu.index -= 1
		when 36 # Gosu::KbEnter should work, but it doesn't, I think it's 88 
			case @menu.selected_item
			when @menu.items[0]
				close
				game_win = GameWindow.new(@width, @height)
				game_win.show
			end
		end
	end
end

class GameWindow < Gosu::Window
	def initialize(width, height)
		@width = width
		@height = height
		super(@width, @height, false)
		@player = Player.new(self)
		@map = create_map(self)
		@room = @map[:first]
	end

	def update
	end

	def draw
		@room.draw
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
		when Gosu::KbEscape
			close
		end
	end
end
