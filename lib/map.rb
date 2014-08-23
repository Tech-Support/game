class Map

	attr_accessor :rooms

	def initialize(window)
		@window = window
		@rooms = {}
	end

	def add_room(window, name, background)
		x = y = 0
		@rooms[name] = Room.new(window, background)
		@rooms[name].background.each do |tile|
			tile.x = x
			tile.y = y
			x += Size::TileWidth
			if x > Size::MapWidth - Size::TileWidth
				tile.y = y
				y += Size::TileHeight
				x = 0
			end
		end
	end

	def [](room)
		@rooms[room]
	end

end

def create_map(window)
	m = Map.new(window)
	
	s = Proc.new { Tile.create(window, :sand) }
	g = Proc.new { Tile.create(window, :grass) }

	# tiles = [
	# 	s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[],
	# 	s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[],
	# 	s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[],
	# 	s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[],
	# 	s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[],
	# 	s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[],
	# 	s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[],
	# 	s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[],
	# 	s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[],
	# 	s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[],
	# 	s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[],
	# 	s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[],
	# 	s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[],
	# 	s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[], s[]
	# ]
	tiles = []
	m.add_room(window, :first, tiles)

	m
end
