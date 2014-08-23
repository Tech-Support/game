class Map

	class << self

		attr_accessor :rooms

		def window=(window)
			@@window = window
		end

		def setup
			tiles = {
				first: []
			}

			@@rooms = {
				first: Room.new(@@window, tiles[:first])
			}
		end

		def [](room)
			@@rooms[room]
		end

	end

end
