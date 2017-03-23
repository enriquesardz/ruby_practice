module Enumerable
  def my_each
    for i in self do
      yield(i)
    end
  end

  def my_each_with_index
    for i in self do
      yield(self[i-1],i-1)
    end
  end

  def my_select
    arr = []
    for i in self do
      arr << i if (yield(i) == true)
    end
    arr
  end

  def my_all?
    for i in self do
      if yield(self[i-1]) == true
        next
      else
        return false
      end
    end
  end

  def my_any?
    for i in self do
      yield(self[i-1]) == true ? (return true) : (next)
    end
    return false
  end

  def my_none?
    for i in self do
      yield(self[i-1]) == true ? (return false) : (next)
    end
    true
  end

  def my_count(*a)
    count = 0
    for i in self
      if (i == a.join.to_i)
        count += 1
      elsif block_given?
        if yield(i)
          count += 1
        end
      elsif (a == [])
        count += 1
      end
    end
    count
  end

  def my_map(proc = nil)
    arr = []
    for i in self
      if proc && block_given?
        arr << proc.call(yield(i))
      elsif block_given?
        arr << yield(i)
      else
        arr << proc.call(i)
      end
    end
    arr
  end

  def my_inject(*arg)
    (arg == []) ? (memo = 0) : memo = arg[0]
    self.my_each { |i| memo = yield(memo,i)}
    memo
  end

end

def multiply_els(arr)
   arr.my_inject(1) {|memo,i| memo*i}
end

puts multiply_els([2,4,5])
