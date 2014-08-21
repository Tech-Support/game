class Tile

	@@avalible_tiles = Dir["images/tiles/*"]

	# sort of a convenience initializer
	def self.create(window, kind, format = "png")
		file_name = "#{kind}.#{format}"
		if @@avalible_tiles.map { |f| File.basename(f) }.include?(file_name)
			Tile.new(window, "images/tiles/#{file_name}")
		else
			# probably throw an error here
		end
	end

	def initialize(window, image_path)
		@window = window
		@image = Gosu::Image.new(@window, image_path, false)
	end

	def draw
	end

end
