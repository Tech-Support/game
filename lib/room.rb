class Room

	attr_accessor :background, :items

	def initialize(window, background)
		@window = window
		@background = background
	end

	def draw
		@background.each { |tile| tile.draw }
	end

end