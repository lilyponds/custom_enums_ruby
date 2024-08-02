module Enumerable
  # Your code goes here
  def my_each_with_index
    return unless block_given?

    i = 0
    until i == length
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    result = []
    i = 0
    until i == length
      result << self[i] if yield(self[i])
      i += 1
    end
    result
  end

  def my_all?
    i = 0
    if !block_given? || length.zero?
      return true
    elsif include?('nil')
      return false
    else
      until i == length
        return false unless yield(self[i])

        i += 1

      end
    end

    true
  end

  def my_any?
    i = 0
    result = ''
    # haven't written to prevent against
    # combination of all falsy values
    if length.zero?
      result = false
      return result
    elsif until i == length
            if yield(self[i])
              result = true
              return result
            elsif result = false
            end
            i += 1
          end
    end
    result
  end

  def my_none?
    i = 0
    result = true
    return result if length.zero?

    until i == length
      if yield(self[i])
        result = false
        return result
      else
        i += 1
      end
    end
    result
  end

  def my_count
    i = 0
    counter = 0

    return length unless block_given?

    until i == length
      counter += 1 if yield(self[i])
      i += 1
    end
    counter
  end

  def my_map
    result = []
    i = 0
    if !block_given?
      result = self
    else
      until i == length
        result << yield(self[i])
        i += 1
      end
    end
    result
  end

  def my_inject(result = 0)
    if block_given?
      base = result
      i = 0
      until i == length
        base = yield(base, self[i])
        i += 1
      end
    end
    base
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return unless block_given?

    for item in self
      yield(item)
    end
  end
end
