require './scripts.rb'

puts '######### all? ############'

print '1: '; puts %w[ant bear cat].all? { |word| word.length >= 3 } #=> true
print '2: '; puts %w[ant bear cat].all? { |word| word.length >= 4 } #=> false
print '3: '; puts %w[ant bear cat].all?(/t/) #=> false
print '4: '; puts [1, 2i, 3.14].all?(Numeric) #=> true
print '5: '; puts [1, 2i, 3.14].all?(String) #=> true
print '6: '; puts [nil, true, 99].all?                              #=> false
print '7: '; puts [].all?                                           #=> true

puts '######### my_all? ############'

print '1: '; puts %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
print '2: '; puts %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
print '3: '; puts %w[ant bear cat].my_all?(/t/)                        #=> false
print '4: '; puts [1, 2i, 3.14].my_all?(Numeric)                       #=> true
print '5: '; puts [1, 2i, 3.14].my_all?(String) #=> true
print '6: '; puts [nil, true, 99].my_all?                              #=> false
print '7: '; puts [].my_all?                                           #=> true


puts '######### any? ############'

print '1: '; puts %w[ant bear cat].any? { |word| word.length >= 3 } #=> true
print '2: '; puts %w[ant bear cat].any? { |word| word.length >= 4 } #=> false
print '3: '; puts %w[ant bear cat].any?(/t/) #=> false
print '4: '; puts [1, 2i, 3.14].any?(Numeric) #=> true
print '5: '; puts [1, 2i, 3.14].any?(String) #=> true
print '6: '; puts [nil, true, 99].any?                              #=> false
print '7: '; puts [].any?                                           #=> true

puts '######### my_any? ############'

print '1: '; puts %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
print '2: '; puts %w[ant bear cat].my_any? { |word| word.length >= 4 } #=> false
print '3: '; puts %w[ant bear cat].my_any?(/t/)                        #=> false
print '4: '; puts [1, 2i, 3.14].my_any?(Numeric)                       #=> true
print '5: '; puts [1, 2i, 3.14].my_any?(String) #=> true
print '6: '; puts [nil, true, 99].my_any?                              #=> false
print '7: '; puts [].my_any?           