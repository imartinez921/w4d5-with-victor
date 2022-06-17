#Phase 1
def my_min(array) # O(n**2)
  min = array[0]
  array.each do |ele1|
    array.each do |ele2|
      # ele1 < ele2
      if ele1 < ele2 && ele1 < min
        min = ele1
      end
    end
  end
  return min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5


#Phase 2 # O(n)
def my_min(array)
  min = array[0]
  array.each {|ele| min = ele if ele < min}
  return min
end

def largest_contiguous_subsum(list) 
  big_array = []
  list.each.with_index do |ele1, idx1|
    big_array << [ele1]
    list.each.with_index do |ele2, idx2|
      big_array << list[idx1..idx2] if idx2 > idx1
    end
  end
# big_array
  big_array.map {|subarray| subarray.sum}.max
end

list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8
list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])