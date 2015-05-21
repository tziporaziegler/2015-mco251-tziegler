class CONSECUTIVE_RANGE
  @array = Array.new

  def initialize(array)
    @array = array
  end

  # @return String
  def find_range

    list = Array.new
    temp = Array.new

    # loop through array and create largest consecutive list
    (0...@array.length).each { |i|
      current = @array[i]
      temp << current
      if i == @array.length - 1
        check(temp,list)
      elsif current + 1 != @array[i + 1]
        check(temp,list)
        temp.clear
      end
    }

   # return largest consecutive range
    (list.size == 1) ? list.first : list.first.to_s << '-' << list.last.to_s
  end

  #see if temp array is longer than current largest consecutive list
  def check(temp,list)
    if temp.length > list.length
      list.clear
      temp.each { |x| list << x }
    end
  end


end

# create and use object
numbers = CONSECUTIVE_RANGE.new([5,6,9,8,7,2,1,11])
print numbers.find_range