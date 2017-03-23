def bubble_sort(array)
  array.length.times do
    array.each_with_index do |value,index|

      current_index = index
      if array[current_index + 1] == nil then next end

      next_index = current_index + 1
      if array[current_index] > array[next_index]
        temp = array[current_index]
        array[current_index] = array[next_index]
        array[next_index] = temp
      end

    end #each with index
  end #array length times
  print "#{array}\n"
end

def bubble_sort_by(array)
  array.length.times do
    array.each_with_index do |value,index|

      current_index = index
      if array[current_index + 1] == nil then next end
      next_index = current_index + 1

      if yield(array[current_index], array[next_index]) > 0
        temp = array[current_index]
        array[current_index] = array[next_index]
        array[next_index] = temp
      end

    end #each with index
  end #array length times
  print "#{array}\n"
end

bubble_sort([4,3,78,2,0,2])
bubble_sort_by(["hi", "hello", "hey"]) do |left,right|
  left.length - right.length
end
# ["hi", "hey", "hello"]
