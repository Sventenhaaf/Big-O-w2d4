# def my_min(arr)
#   lowest = false
#   arr.each do |el1|
#     arr.each do |el2|
#       if el1 <= el2
#         lowest = true
#       else
#         lowest = false
#         next
#     end
#   end
# end

def my_min(arr)
  arr.each do |el|
    return el if lowest_one?(el, arr)
  end
end

def lowest_one?(el, arr)
  arr.each do |el2|
    return false if el > el2
  end
  return true
end


list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p "my min phase 1"
p  my_min(list)  # =>  -5

def my_min2(arr)
  min = arr[0]
  arr.each do |el|
    min = el if el < min
  end
  min
end


list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p "my min phase 2:"
p  my_min2(list)  # =>  -5


def largest_contiguous_subsum(arr)
  sub_arrays = []
  arr.each_with_index do |el1, idx1|
    arr[idx1..-1].each_with_index do |el2, idx2|
      sub_arrays << arr[idx1..idx2+idx1]
    end
  end
  p sub_arrays

  sub_arrays.map! { |el| el.inject{|adder, num| adder + num} }
  p sub_arrays
  sub_arrays.max
end

list = [5, 3, -7]
p "sub sum phase 1:"
p  largest_contiguous_subsum(list) # => 8

def largest_contiguous_subsum2(arr)
  max_num = arr[0]
  arr.each do |el|

  end
end
