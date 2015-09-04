def bad_two_sum?(arr, target_sum)
  arr.each do |el1|
    arr.each do |el2|
      return true if el1 + el2 == target_sum && el1 != el2
    end
  end
  false
end



p "bad_two_sum"
arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false



def sort_two_sum?(arr, target_sum)
  sorted_arr = arr.sort # O(nlogn)

  arr.each_with_index do |el, idx|
    bsearch_index = binary_search(arr, target_sum - el)
    return true unless bsearch_index.nil? || bsearch_index == idx
  end
  false
end

def binary_search(arr,target)
  half = arr.length/2
  left = arr.take(half)
  right = arr.drop(half + 1)
  return half if arr[half] == target
  return nil if arr.length < 1
  if arr[half] > target
    binary_search(left,target)
  else
    if binary_search(right,target) == nil
      return nil
    else
      binary_search(right,target) + half + 1
    end
  end

end

p "sort_two_sum?"
arr = [0, 1, 5, 7]
p sort_two_sum?(arr, 6) # => should be true
p sort_two_sum?(arr, 10) # => should be false



# def hash_map_sum?(arr, target_sum)
#   hash = {}
#   arr.each do |num|
#     hash[target_sum - num] = true
#   end
#   hash.has_key?(target_sum - num)
# end

def hash_map_sum?(arr, target_sum)
  hash = {}
  arr.each do |num|
    return true if hash.has_key?(target_sum - num)
    hash[num] = target_sum - num
  end
  false
end


p "hash_map_sum?"
arr = [0, 1, 5, 7]
p hash_map_sum?(arr, 6) # => should be true
p hash_map_sum?(arr, 10) # => should be false
