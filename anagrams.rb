def first_anagram(string1, string2)
  anagrams(string1).include?(string2)
end


def anagrams(string)
  return [string] if string.length < 2
  previous = anagrams(string[0...-1])
  letter = string[-1]
  result = []

  previous.each do |word|
    (word.length + 1).times do |i|
      result << (word[0...i] + letter + word[i..-1])
    end
  end
  result
end
p "first anagrams:"
p first_anagram("elvis","lives")
p first_anagram("gizmo","sally")
p "phase 1 is n!"

def second_anagrams(string1,string2)
  array1 = string1.split("").dup
  array2 = string2.split("").dup

  array1.each do |char|
    if array2.include?(char)
      array2.delete_at(array2.index(char))
    else
      return false
    end
  end
  if array2.empty?
    return true
  end
  return false
end

p "second anagrams:"
p second_anagrams("elvis","lives")
p second_anagrams("gizmo","sally")
p "phase 2 is n"



def third_anagrams(string1, string2)
  string1.split("").sort == string2.split("").sort
end


p "third_anagrams:"
p third_anagrams("elvis","lives")
p third_anagrams("gizmo","sally")
p "phase 3 is n*ln(n)"


def fourth_anagrams(string1, string2)
  hash1 = Hash.new { |h,k| h[k] = 0 }
  hash2 = Hash.new { |h,k| h[k] = 0 }

  string1.split("").each do |letter|
    hash1[letter] +=1
  end
  string2.split("").each do |letter|
    hash2[letter] +=1
  end

  hash1 == hash2
end

p "fourth_anagrams:"
p fourth_anagrams("elvis","lives")
p fourth_anagrams("gizmo","sally")
p "phase 4 is n"



def fourth_anagrams_bonus(string1, string2)
  hash1 = Hash.new { |h,k| h[k] = 0 }
  hash2 = Hash.new { |h,k| h[k] = 0 }

  string1.split("").each do |letter|
    hash1[letter] +=1
  end
  string2.split("").each do |letter|
    hash1[letter] -=1
  end

  hash1.values.all?{|el| el.zero?}
end

p "fourth_anagrams_bonus:"
p fourth_anagrams_bonus("elvis","lives")
p fourth_anagrams_bonus("gizmo","sally")
p "phase 4 is n"
