require_relative 'my-stack'
def windowed_max_range(arr, w)
  current_max_range = nil
  arr[0..-w].each_with_index do |el, idx|
    range = arr[idx...idx+w]
    max = range.max
    min = range.min

    if current_max_range == nil
      current_max_range = max - min
    elsif current_max_range < max - min
      current_max_range = max - min
    end
  end

  # p current_max_range
  current_max_range

end


p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8



def windowed_max_range_stacks(arr, w)
  queue = Queue.new

  w.times do |idx|
    queue.enqueue(arr[idx])
  end
  maximum = queue.max - queue.min


  arr[w..-1].each do |el|
    queue.enqueue(el)
    queue.dequeue
    maximum = queue.max - queue.min  if maximum < (queue.max - queue.min)
  end
  maximum
end


p windowed_max_range_stacks([1, 0, 2, 5, 4, 8], 2)# == 4 # 4, 8
p windowed_max_range_stacks([1, 0, 2, 5, 4, 8], 3)# == 5 # 0, 2, 5
p windowed_max_range_stacks([1, 0, 2, 5, 4, 8], 4)# == 6 # 2, 5, 4, 8
p windowed_max_range_stacks([1, 3, 2, 5, 4, 8], 5)# == 6 # 3, 2, 5, 4, 8
