class Player

	def initialize(window)
		@window = window
		@position = {x: 0, y: 0}
		@sprites = %w[up down left right].map do |dir|
			[dir.to_sym, Gosu::Image.new(@window, "images/#{dir}.png", false)]
		end
		@sprites = @sprites.to_h
		@image = @sprites[:down]
	end

	def draw
		@image.draw(@position[:x], @position[:y], ZOrder::Sprites)
	end

	def walk(direction)
		case direction
		when :right
			@image = @sprites[direction]
			@position[:x] += Size::TileWidth
		when :left
			@image = @sprites[direction]
			@position[:x] -= Size::TileWidth
		when :up
			@image = @sprites[direction]
			@position[:y] -= Size::TileHeight
		when :down
			@image = @sprites[direction]
			@position[:y] += Size::TileHeight
		end
	end

end
