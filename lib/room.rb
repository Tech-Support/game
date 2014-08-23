class Room

	attr_accessor :tiles

	def initialize(window, tiles)
		@window = window
		@tiles = tiles
	end

	def draw
		# it'll be on ZOrder::Background
	end

end