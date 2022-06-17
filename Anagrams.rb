require "byebug"


#Phase 1

# def first_anagram?(str1,str2)
#   anagrams = []
#   str_arr = str1.split("")

#   (0...str_arr.length).each do |i|
#     # debugger
#     (0...str_arr.length).each do |j|
#       str_arr[i], str_arr[j] = str_arr[j], str_arr[i]
#       # if !anagrams.include?(str_arr.join(""))
#       anagrams << str_arr.join("") 
#       # end
#       str_arr[i], str_arr[j] = str_arr[j], str_arr[i]
#       # str_arr[i], str_arr[j] = str_arr[j], str_arr[i]
#     end
#   end
#   anagrams
#   # return anagrams.include?(str2)
# end

def first_anagram?(str1, str2)
  anagrams = [] #[]
  str_arr = str1.split("") #[h,e,l,l,o]

  until anagrams.include?(str1)
    i = 0

    while  i < str1.length - 1
      str_arr[i], str_arr[i+1] = str_arr[i+1], str_arr[i] #h  , l,
      anagrams << str_arr.join("") #[e, l , l, o, h]
      i += 1
    end
  end
p anagrams
  anagrams.include?(str2)
end



  
# countHash = Hash.new(0)
# (0...str1.length-1).each do |i|

# p first_anagram?("bell","lebl")



#Phase 2
def second_anagram?(str1,str2)
  str_arr = str1.split("")

  str1.each_char do |char|
    i = str2.index(char)
    str2 = str2[0...i] + str2[i+1..-1]
  end
  
  str2.empty?
end


# p second_anagram?("bell","lebl")




#Phase 3

def third_anagrams(str1,str2)
    str1.chars.sort == str2.chars.sort
end

p third_anagrams("bell","lebl")


#Phase 4
def fourth_anagram?(str1,str2)
  countHash = Hash.new(0)

  str1.each_char {|char| countHash[char] += 1}
  str2.each_char {|char| countHash[char] += 1}

  countHash.each {|k,v| return false if v != 2}

end
