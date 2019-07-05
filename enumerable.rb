module Enumerable
  def my_each
    for i in 0...size
      yield(self[i])
    end
  end

  def my_each_with_index
    for i in 0...size
      yield(self[i], i)
    end
  end

  def my_select
    arr = []
    self.my_each do |i|
      arr << i if yield(i)
    end

    arr
  end

  def my_all?
    self.my_each do |i|
      block = yield(i) if block_given?
      return false if i.nil? || !i || !block
    end

    true
  end

  def my_any?
    self.my_each do |i|
      block = yield(i) if block_given?
      return true if i.nil? || i || block
    end

    false
  end

  def my_none?
    return true if !block_given?

    self.my_each do |i|
      return false if yield(i)
    end

    true
  end

  def my_count

  end

  def my_map
    arr = []
    self.my_each do |i|
      arr << yield(i)
    end

    arr
  end

  def my_inject

  end
end

arr = [1, 3]
# puts arr.my_each
# arr.my_each_with_index do |val,i|
#   puts val, i
# end

# puts [1,2,3,4,5,6].my_select { |num| num.even?  }

# puts [1, 3].my_map { |i| i*i }

# puts [nil, true, 99].all?
# puts [nil, true, 99].my_all?
# puts [].my_all?(2, 34)

# puts %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
# puts %w[ant bear cat].my_any? { |word| word.length >= 4 } #=> false
#                      #=> true
# puts [nil, true, 99].my_any?                              #=> false
# puts [].my_any?

puts %w[ant beass cat].my_none? { |word| word.length > 4 } #=> false
