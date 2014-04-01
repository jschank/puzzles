module HittingRockBottom
  class Cave
    Air = ' '
    Water = '~'
    Rock = '#'

    def initialize(string_array = [""])
      height = string_array.length
      length = string_array[0].length
      @cave = Grid.new(height, length)
      height.times do |height|
        length.times do |length|
          @cave[height, length] = string_array[height][length]
        end
      end
      influx = find_influx
      @water_head = influx
    end

    def add_water
      # try below
      # try to the right
      # go to leftmost Air one row up
    end

    def depth_report
      @cave.columns.map{|c| c.select{ |i| i == Water}.length }.join(' ')
    end

    def to_s
      @cave.to_s
    end

    private
    def find_influx
      # Assumption - Influx is always in column 0.
      return nil if @cave.empty?
      col = @cave.columns[0]
      row = col.index(Water)
      [row,0]
    end

  end
end
