class Map

	class << self

		attr_accessor :rooms

		@@backgrounds = {}
		@@x = 0
		@@y = 0

		def window=(window)
			@@window = window
		end

		def add_background(name, rooms)
			@@backgrounds[name] = rooms
			x = y = 0
			@@backgrounds[name].each do |tile|
				tile.x = x
				x += 32
				if Size::Columns - 1 > x
					tile.y = y
					y += 33
					x = 0
				end
			end
		end

		def setup
			add_background(:first, [])

			@@rooms = {
				first: Room.new(@@window, @@backgrounds[:first])
			}
		end

		def [](room)
			@@rooms[room]
		end

	end

end
