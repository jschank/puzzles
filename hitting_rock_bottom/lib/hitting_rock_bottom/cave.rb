module HittingRockBottom
  class Cave
    Air = ' '
    Water = '~'
    Rock = '#'

    def initialize(string_array = [""], influx_coords = nil)
      if string_array.is_a? String
        string_array.gsub!(/^\s+/, '').chomp!
        string_array = string_array.split("\n")
      end

      height = string_array.length
      length = string_array[0].length
      @grid = Grid.new(height, length)
      height.times do |height|
        length.times do |length|
          @grid[height, length] = string_array[height][length]
        end
      end
      @water_head = influx_coords || find_influx
      fail "Could not find initial water unit in cave" unless @water_head
    end

    def add_water
      @water_head = next_water_location
      @grid[*@water_head] = Water
    end

    def depth_report
      @grid.columns.map do |c|
        str = c.join()
        (str =~ /~\s/) ? Water : str.count(Water)
      end.join(' ')
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
      # try to put next unit below the head first
      coord = coord_below(@water_head)
      return coord if @grid[*coord] == Air

      # if that doesn't work, try to put the next unit to the right of the head
      coord = coord_right(@water_head)
      return coord if @grid[*coord] == Air

      # if that doesn't work, seek to the first water unit in this column, and try to put the next
      # unit to the right of that.
      temp_head = seek_top_of_water_column(@water_head)
      coord = coord_right(temp_head)
      return coord if @grid[*coord] == Air

      # if that doesn't work, move up one row from there, and select the first air in that row.
      first_air_on_row_above(temp_head)
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

    def seek_top_of_water_column(coord)
      row = coord[0]
      col = coord[1]
      column = @grid.columns[col]
      index = column.find_index{ |i| i == Water }
      coord = [index, col]
    end

  end
end
