require "byebug"
#my_min##

list1 = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
    
#O(n^2)
def my_min(array)
    current_smallest = 0
    (0...array.length).each do |idx1|
        (idx1+1...array.length).each do |idx2|
           current_smallest = array[idx1] if (array[idx1] < array[idx2]) && (array[idx1] < current_smallest)
        end
    end
    current_smallest
end
# p my_min(list)  # =>  -5

# O(n)
def my_min2(array)
    array.inject { |acc, ele| acc < ele ? acc : ele}
end

# p my_min2(list)  # =>  -5

#Largest Contiguous Sub-sum

   list2 = [-5, -1, -3]
   list3 = [2, 3, -6, 7, -6, 7]

   def largest_contiguous_subsum(array)
    subs = []
    (0...array.length).each do |start|
        (start...array.length).each do |stop|
            subs << array[start..stop]
        end
    end
    # find which pair has highest sum
    max_sum = subs.map(&:sum).max
    max_sum
   end


#    p largest_contiguous_subsum(list3) # => 8 (from [7, -6, 7])
#    p largest_contiguous_subsum(list2) # => -1 (from [-1])



#[5]
#[5,3]
#[5,3,-7]

#[3]
#[3,-7]

#[-7]
# [1,2,-7, 3, 9, -2]
def better_largest_contiguous_subsum(list)
    current_largest_sum = 0
    current_sum = 0
    return list.max if list.all? {|ele| ele < 0}

    (0...list.length).each do |i |
        # debugger
        #add current element to current sum
        current_sum += list[i]

        #if current sum is less than 0 ignore it and reset to move on to next number
        if ( current_sum < 0 ) 
            current_sum = 0
        end 
        # if current sum is greater than our current largest sum, we want to keep it
        if current_sum > current_largest_sum
            current_largest_sum = current_sum
        end
    end
    current_largest_sum
end

p better_largest_contiguous_subsum([1,2,-7, 3, 9, -2])
p better_largest_contiguous_subsum([2, 3, -6, 7, -6, 7])
p better_largest_contiguous_subsum([-3, -6, -6, -2, -7, -7])

