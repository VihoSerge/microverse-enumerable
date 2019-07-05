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
