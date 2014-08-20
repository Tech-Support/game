class Player

	def initialize(window)
		@window = window
		@width = 32
		@height = 33
		@position = {x: 0, y: 0}
		@sprites = %w[up down left right].map do |dir|
			[dir.to_sym, Gosu::Image.new(@window, "images/#{dir}.png", false)]
		end
		@sprites = @sprites.to_h
		@image = @sprites[:down]
	end

	def update
	end

	def draw
		@image.draw(@position[:x], @position[:y], ZOrder::Sprites)
	end

	def walk(direction)
		case direction
		when :right
			@image = @sprites[direction]
			@position[:x] += @width
		when :left
			@image = @sprites[direction]
			@position[:x] -= @width
		when :up
			@image = @sprites[direction]
			@position[:y] -= @height
		when :down
			@image = @sprites[direction]
			@position[:y] += @height
		end
	end

end
