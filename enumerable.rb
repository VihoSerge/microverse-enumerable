module Enumerable
  def my_each
    for i in 0...self.length
      yield(self[i])
    end
  end

  def my_each_with_index

  end

  def my_select

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

  end

  def my_inject

  end
end

arr = [1, 3]

arr.my_each do | i |
  puts i
end
