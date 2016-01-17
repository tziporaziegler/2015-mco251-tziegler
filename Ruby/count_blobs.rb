class Cells
    attr_accessor :data, :visited, :row, :col
  def initialize(row, col, data = nil)
    @row = row.to_i
    @col = col.to_i
    @visited = false
    @data = data
  end

  def to_s
    @data == nil ? '-' : @data #remove double quotes, change = to == and change to conditional
  end

  def has_data #hasData to has_data
    @data == nil #= to == and remove ?
  end
  def reset
    @data=nil
    @visited = false
  end
end



class Stack
  def initialize
    @store = Array.new
  end

  def pop
    @store.pop
  end

  def push(element)
    @store.push(element)
    self
  end

  def size
    @store.size
  end

  #create empty method
  def empty
    @store.length == 0
  end
end



class Count_blobs
  attr_accessor(:rows, :cols)
  def initialize(rows, cols)
    @stack = Stack.new
    rows = rows.to_i
    cols =cols.to_i
    @cells = Array.new

    (1...rows).each do |i| #.each instead of .to_i
      temp = Array.new #create temp
      (1...cols).each do |j|
       temp.push(Cells.new(i,j)) #fetch and .new instead of new Cells
      end
      @cells.push(temp)
    end
  end

  def set_grid(percentage, value) #setGrid to set_grid
    randomGenerator = Random.new
    #use |variables| as i and j
    (0...@cells.size - 1).each do |i| #-1
      (0...@cells.fetch(i).size - 1).each do |j| #.fetch instead of [i] and .each
        random_num = randomGenerator.rand(100) #randomNum to random_num
        if random_num < percentage
          cell = @cells.fetch(i).fetch(j)
          cell.data = value # fetch + Data to data + .date(value) to .data  = value
        end
      end
    end
  end

  def count(value)
    counter = 0
    (0...@cells.size - 1).each do |i| # change row to @cells.size - 1 + do .each
      (0...@cells.fetch(i).size - 1).each do |j|
        start_cell = @cells.fetch(i).fetch(j) #current_cell
        puts "starting at cell #{i} #{j}" #change print to puts change to placeholder notation
        if(!start_cell.visited && start_cell.has_data) #data to has_data
          counter += 1
          current_cell = start_cell
          move(current_cell,i,j)
          while (!@stack.empty)
            current_cell = @stack.pop()
            move(current_cell,current_cell.row, current_cell.col)
          end
        end
      end
    end
    return counter
  end

def move(current_cell, row, col) #currentCell to current_cell
  right(current_cell,row,col)
  left(current_cell,row,col)
  down(current_cell,row,col)
  up(current_cell,row,col)
end

  def right(current_cell, row, col)
    if(current_cell.col != @cells.fetch(row).size() - 1)
        temp_cell = @cells.fetch(row).fetch(col+1) # remove temp_cell = nil and change tempCell to temp_cell
        if(!temp_cell.visited && temp_cell.data)
            @stack.push(temp_cell)
        end
        temp_cell.visited
    end
  end

  def left(current_cell, row, col)
    if(current_cell.col != 0)
        temp_cell = @cells.fetch(row).fetch(col-1)
        if(!temp_cell.visited && temp_cell.has_data) #Data to has_data
            @stack.push(temp_cell)
        end
        temp_cell.visited
    end
  end

  def up(current_cell, row, col)
    if(current_cell.row != 0)
      temp_cell = @cells.fetch(row-1).fetch(col)
      if(!temp_cell.visited && temp_cell.has_data)
        @stack.push(temp_cell)
      end
      temp_cell.visited
    end
  end

  def down(current_cell, row, col)
    if(current_cell.row != @cells.size-1) #Row to row
      temp_cell = @cells.fetch(row+1).fetch(col)

      if(!temp_cell.visited && temp_cell.has_data)
        @stack.push(temp_cell)
      end
      temp_cell.visited
    end
  end

  def to_s
    string = String.new
    (0...@cells.size - 1).each do |i| # change row to @cells.size - 1 + do .each
        (0...@cells.fetch(i).size - 1).each do |j|
            string << @cells.fetch(i).fetch(j).to_s #fetch + change to Cell.to_s instead of if/else
        end
        string << "\n"
    end
      
    return string
  end
  
end


the_grid = Count_blobs.new(10,10) #theGrid to the_grid
the_grid.set_grid(30,'x')
puts the_grid.to_s #print to puts
puts the_grid.count('x')
