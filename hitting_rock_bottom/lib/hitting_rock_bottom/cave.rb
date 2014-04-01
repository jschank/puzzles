module HittingRockBottom
  class Cave
    Air = ' '
    Water = '~'
    Rock = '#'

    def initialize(string_array = [""])
      height = string_array.length
      length = string_array[0].length
      @grid = Grid.new(height, length)
      height.times do |height|
        length.times do |length|
          @grid[height, length] = string_array[height][length]
        end
      end
      @water_head = find_influx
      fail "Could not find initial water unit in cave" unless @water_head
    end

    def add_water
      @water_head = next_water_location
      @grid[*@water_head] = Water
    end

    def depth_report
      @grid.columns.map{|c| c.select{ |i| i == Water}.length }.join(' ')
    end

    def to_s
      @grid.to_s
    end

    private
    def find_influx
      # Assumption - Influx is always in column 0.
      return nil if @grid.empty?
      col = @grid.columns[0]
      row = col.index(Water)
      [row,0]
    end

    def next_water_location
      coord = coord_below(@water_head)
      return coord if @grid[*coord] == Air

      coord = coord_right(@water_head)
      return coord if @grid[*coord] == Air

      first_air_on_row_above(@water_head)
    end

    def coord_below(coord)
      [coord[0]+1, coord[1]]
    end

    def coord_right(coord)
      [coord[0], coord[1]+1]
    end

    def first_air_on_row_above(coord)
      row = coord[0]-1
      index = @grid.rows[row].find_index{ |i| i == Air }
      fail "Cave is already full of water" unless index
      [row, index]
    end
  end
end
