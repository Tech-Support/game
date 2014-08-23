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
			x += 32
			if Size::Columns - 1 > x
				tile.y = y
				y += 33
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
	
	# sand = Proc.new { Tile.create(window, "sand") }


	# tiles = [
	# 	sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[],
	# 	sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[],
	# 	sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[],
	# 	sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[],
	# 	sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[],
	# 	sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[],
	# 	sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[],
	# 	sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[],
	# 	sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[],
	# 	sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[],
	# 	sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[],
	# 	sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[],
	# 	sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[],
	# 	sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[], sand[]
	# ]
	# m.add_room(window, :first, tiles)

	m
end
