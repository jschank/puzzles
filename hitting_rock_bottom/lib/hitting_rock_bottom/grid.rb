module HittingRockBottom
  class Grid
    def initialize(rows = 0, columns = 0)
      @rows = rows
      @columns = columns
      @grid = Array.new(@rows) { Array.new(@columns) }
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
      empty? ? 0 : @rows * @columns
    end

    def [](row, column)
      bounds_check(row, column)
      @grid[row][column]
    end

    def []=(row, column, value)
      bounds_check(row, column)
      @grid[row][column] = value
    end

    private
    def bounds_check(row, column)
      fail(IndexError, "Row #{row} is out of range for this grid", caller) if row >= @rows
      fail(IndexError, "Column #{column} is out of range for this grid", caller) if column >= @columns
    end

  end
end
