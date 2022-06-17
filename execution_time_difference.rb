require "byebug"

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


# Phase 1 # n**2
def prev_largest_contiguous_subsum(list) #2n + n**2
  big_array = []
  list.each.with_index do |ele1, idx1| #n
    big_array << [ele1]
    list.each.with_index do |ele2, idx2| #*n
      big_array << list[idx1..idx2] if idx2 > idx1
    end
  end
  big_array.map {|subarray| subarray.sum}.max #2n
end

list = [5, 3, -7]
# p largest_contiguous_subsum(list) # => 8
list = [2, 3, -6, 7, -6, 7]
# "These are all the subarrays:"
# p prev_largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
# list = [-5, -1, -3]
# p prev_largest_contiguous_subsum(list) # => -1 (from [-1])



#Phase 2 #
# def largest_contiguous_subsum(list) #
#   largest_sum = list[0]
  
#   until list.empty?
#     # debugger
#     current_sum = 0
#     list.each do |ele|
#       current_sum += ele
#       largest_sum = current_sum if largest_sum < current_sum
#     end
#     list.shift
#   end
#   return largest_sum
# end

def largest_contiguous_subsum(list) #[5, 3, -7]
  largest_sum = list.first #
# debugger
  list.each.with_index do |ele,i| #3
    if list[0..i].sum > largest_sum #3
      largest_sum = list[0..i].sum
    end
    if list[i..-1].sum > largest_sum #
      largest_sum = list[i..-1].sum
    end
    if ele > largest_sum
      largest_sum = ele
    end
  end
  largest_sum

end



    [5]           # => 5
    [5, 3]        # => 8 --> we want this one
    [5, 3, -7]    # => 1
    [3]           # => 3
    [3, -7]       # => -4
    [-7]          # => -7

list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8
list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])