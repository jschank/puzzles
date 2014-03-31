module HittingRockBottom
  class Grid
    def initialize(rows = 0, cols = 0)
      @grid = Array.new(rows) { Array.new(cols) }
    end
    def empty?
      @grid.all? { |col| col.empty? }
    end

    def rows
      @grid
    end

    def columns
      @grid.transpose
    end

    def cells
      empty? ? 0 : @grid.length * @grid[0].length
    end
  end
end
