class NUMBERS_MISSING
  @array = Array.new

  def initialize(array)
    @array = array
  end

  def find_missing
    builder = String.new
    length = @array.length

    # do first
    first = @array.first
    place = 0

    if first == 0
      consecutive = true
      (0...length - 1).each { |i|
        if @array[i] + 1 == @array[i + 1]
          consecutive ? place += 1 : break
        else
          consecutive = false
        end
      }
    else
      builder << 0.to_s
      builder << '-' << (first - 1).to_s if first > 1
      builder << ',' if length > 2
    end

    # do middle
    comma = false
    (place...length - 1).each { |i|
      if @array[i + 1] - 1 != @array[i] - 1
        num1 = @array[i] + 1
        num2 = @array[i + 1] - 1
        if num1 != num2
          if num1 < num2
            comma ? builder << ',' : comma = true
            builder << num1.to_s << '-' << num2.to_s
          end
        else
          comma ? builder << ',' : comma = true
          builder << num1.to_s
        end
      end
    }

    # do last
    last = @array.last
    if last != 99
      builder << ',' if length - place > 1 or (length == 1 and first !=0)
      builder << (@array[@array.length - 1] + 1).to_s
      builder << '-' << 99.to_s if last != 98
    end
  end
end

array = NUMBERS_MISSING.new([0,1,2,50,52,75])
print array.find_missing