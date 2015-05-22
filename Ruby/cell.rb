class Cell
  attr_writer :data
  attr_reader :row
  attr_reader :col
  attr_accessor :visited

  def initialize(row, col, data = nil)
    @row = row
    @col = col
    @data = data
    @visited = false
  end

  def to_string
    @data == nil ? '-' : @data
  end

  def has_data
    @data != nil
  end
end