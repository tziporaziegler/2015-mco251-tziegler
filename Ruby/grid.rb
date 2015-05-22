require './cell.rb'

class Grid

  def initialize(rows, columns)
    @cells = Array.new

    # initialize each cell of the grid
    (0...rows).each { |row|
      temp_array = Array.new # set up a Array that will represent a new row in a two dimensional grid
      (0...columns).each { |col|
        temp_array.push Cell.new row, col # add a Cell to this Array
      }
      @cells.push temp_array # add this new array to the Array of Arrays
    }
  end

  def set_grid(percentage, value)
    (0...@cells.size).each do |row|
      n = @cells.fetch(row)
      (0...n.size).each { |col|
        random_num = Random.rand(100)
        n.fetch(col).data = value if random_num < percentage
      }
    end
  end

  def count_blobs
    count = 0

    (0...@cells.size).each { |row|
      n = @cells.fetch(row)
      (0...n.size - 1).each { |col|
        start_cell = n.fetch(col)
        puts "starting at cell [#{row}][#{col}]"
        if !start_cell.visited && start_cell.has_data
          count += 1
          mark_blob start_cell # mark the blob connected to starting cell
        end
      }
    }

    count
  end

  def mark_blob(current_cell)
    current_col = current_cell.col
    current_row = current_cell.row

    # mark the current cell as visited
    puts "current cell #{current_row} #{current_col} "

    # went this route already ,no need to explore it again
    return if current_cell.visited

    current_cell.visited = true

    # base case / anchor case - end of connecting blob - hit empty space
    return unless current_cell.has_data

    traverse 'up', current_cell, current_row - 1, current_col if current_row > 0
    traverse'down', current_cell, current_row + 1, current_col if current_row < @cells.size - 1
    traverse 'left', current_cell, current_row, current_col - 1 if current_col > 0
    traverse 'right', current_cell, current_row, current_col + 1 if current_col < @cells.fetch(current_row).size - 1
  end

  def traverse (word, current_cell, row, col)
    puts "moved #{word} from cell #{current_cell.to_string} #{current_cell.row} #{current_cell.col}"
    mark_blob @cells.fetch(row).fetch(col)
  end

  def to_string
    builder = String.new
    (0...@cells.size - 1).each { |row|
      builder << "\n"
      n = @cells.fetch(row)
      (0...n.size - 1).each { |col|
        builder << " #{n.fetch(col).to_string}"
      }
    }
    builder
  end
end

grid = Grid.new 10, 10
grid.set_grid 40, 'X'
puts grid.to_string
puts grid.count_blobs
puts grid.to_string