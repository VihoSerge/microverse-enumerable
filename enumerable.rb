module Enumerable
  def my_each
    for i in self
      yield(i)
    end
  end

  def my_each_with_index
    for i in 0...size
      yield(self[i], i)
    end
  end

  def my_select
    arr = []
    self.my_each { |i| arr << i if yield(i) }
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

  def my_count val = nil
    return size if val.nil? && !block_given?

    if val
      count = 0
      for i in 0...size
        count += 1 if val == self[i]
      end

      return count
    end

    count = 0
    for i in 0...size
      count += 1 if yield(self[i])
    end

    return count
  end

  def my_map proc=nil
    result = []
    if proc
      self.my_each { |i| result << proc.call(i) }
    else
      self.my_each { |i| result << yield(i) }
    end
    result
  end

  def my_inject arg = nil
    return nil if !block_given?

    if !arg.nil?
      result = arg
      x = 0
    else
      result = self[0]
      x = 1
    end

    self[x..-1].my_each { |i| result = yield(result, i) }

    result
  end
end

def multiply_els arg
  arg.my_inject { |product, n| product * n }
end
