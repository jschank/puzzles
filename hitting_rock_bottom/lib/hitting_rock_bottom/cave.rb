module HittingRockBottom
  class Cave
    Air = ' '
    Water = '~'
    Rock = '#'

    def initialize(height = 0, length = 0, fill = nil)
      @cave = Grid.new(height, length)
      height.times do |height|
        length.times do |length|
          @cave[height, length] = fill
        end
      end
    end

    def to_s
      @cave.to_s
    end
  end
end
