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

  end

  def my_any?

  end

  def my_none?

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

puts [1, 3].my_map { |i| i*i }
