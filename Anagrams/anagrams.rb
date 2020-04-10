#phase 1

def first_anagram?(word1, word2)
    p "Running first_anagram?..." 

    start = Time.now

    chars = word1.split("") # o(n) ?
    combos = chars.permutation.to_a # o(n!)
    anagrams = combos.map do |combo| # o(n)
        combo.join("") # o(n)
    end

    p "Took #{Time.now - start} seconds"


    anagrams.include?(word2) # o(n)
end

#what is the time complexity of this solution? o(n!)
#what happens if you increase the size of the strings? will be a lot slower

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

#phase 2

def second_anagram?(word1, word2)
    p "Running second_anagram?..." 

    start = Time.now
    word2 = word2.split("") #O(n)
    word1.each_char do |char| #O(n)
        char_index = word2.index(char) #O(n)
        if char_index.nil? #O(1)
            return false #O(1)
        else
            word2.delete_at(char_index) #O(1)
        end
    end
    word2.empty? #O(1)
        p "Took #{Time.now - start} seconds"
end

# p second_anagram?("gizcxzmoasdfg", "sallcasdfgxzy")    #=> false
# p second_anagram?("eelviscxzasdfg", "elivcxasdfgzes")    #=> true

#what is the time complexity of this solution? o(n)
#what happens if you increase the size of the strings? will be a little slower

def third_anagram?(word1, word2)

    p "Running third_anagram..." 

    start = Time.now

    var = word1.split("").sort == word2.split("").sort

    puts "Took #{Time.now - start} seconds - Result: #{var}"

    # return var
end

# p second_anagram?("gizcxzmoasdfg", "sallcasdfgxzy")    #=> false
# p second_anagram?("eelviscxzasdfg", "elivcxasdfgzes")    #=> true

# def my_quick_sort(&prc)  WHY IS QUICKSORT N^2
#     prc ||= proc {|a, b| a<=>b}
#     return self if size < 2

#     pivot = first
#     left = self[1..-1].select{|el| prc.call(el, pivot) == -1} o(n)
#     right = self[1..-1].select{|el| prc.call(el, pivot) != -1} o(n)
#     left.my_quick_sort(&prc) + [pivot] + right.my_quick_sort(&prc) 
#   end  

def fourth_anagram?(word1, word2)
 
    p "Running fourth_anagram..." 

    start = Time.now
 
    hash1 = Hash.new(0)
    # hash2 = Hash.new(0)

    word1.each_char {|char| hash1[char] += 1}
    # word2.each_char {|char| hash2[char] += 1}

    hash1.all?{ |k,v| v == word2.count(k)}


    # puts "Took #{Time.now - start} seconds"
end
p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true

# p fourth_anagram?("gizcxzmoasdfg", "sallcasdfgxzy")    #=> false WHY DO WE GET VARYING TIMES EVEN WITH SAME WORDS
# p fourth_anagram?("eelviscxzasdfg", "elivcxasdfgzes")    #=> true



def fifth_anagram?(word1, word2) # O(n)
 
    p "Running fifth_anagram..." 

    start = Time.now
 
    hash1 = Hash.new(0)
    # hash2 = Hash.new(0)

    word1.each_char {|char| hash1[char] += 1}
    word2.each_char {|char| hash1[char] += 1}

    hash1.values.all? {|v| v.even?}


    # puts "Took #{Time.now - start} seconds"

    
end
p fifth_anagram?("gizmo", "sally")    #=> false
p fifth_anagram?("elvis", "lives")    #=> true