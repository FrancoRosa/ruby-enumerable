require './scripts.rb'

# rubocop:disable all 

puts '######### all? ############'

print '1: '; puts %w[ant bear cat].all? { |word| word.length >= 3 }
print '2: '; puts %w[ant bear cat].all? { |word| word.length >= 4 }
print '3: '; puts %w[ant bear cat].all?(/t/)
print '4: '; puts [1, 2i, 3.14].all?(Numeric)
print '5: '; puts [1, 2i, 3.14].all?(String)
print '6: '; puts [nil, true, 99].all?
print '7: '; puts [].all?

puts '######### my_all? ############'

print '1: '; puts %w[ant bear cat].my_all? { |word| word.length >= 3 }
print '2: '; puts %w[ant bear cat].my_all? { |word| word.length >= 4 }
print '3: '; puts %w[ant bear cat].my_all?(/t/)
print '4: '; puts [1, 2i, 3.14].my_all?(Numeric)
print '5: '; puts [1, 2i, 3.14].my_all?(String)
print '6: '; puts [nil, true, 99].my_all?
print '7: '; puts [].my_all?

puts '######### any? ############'

print '1: '; puts %w[ant bear cat].any? { |word| word.length >= 3 }
print '2: '; puts %w[ant bear cat].any? { |word| word.length >= 4 }
print '3: '; puts %w[ant bear cat].any?(/t/)
print '4: '; puts [1, 2i, 3.14].any?(Numeric)
print '5: '; puts [1, 2i, 3.14].any?(String)
print '6: '; puts [nil, true, 99].any?
print '7: '; puts [].any?

puts '######### my_any? ############'

print '1: '; puts %w[ant bear cat].my_any? { |word| word.length >= 3 }
print '2: '; puts %w[ant bear cat].my_any? { |word| word.length >= 4 }
print '3: '; puts %w[ant bear cat].my_any?(/t/)
print '4: '; puts [1, 2i, 3.14].my_any?(Numeric)
print '5: '; puts [1, 2i, 3.14].my_any?(String)
print '6: '; puts [nil, true, 99].my_any?
print '7: '; puts [].my_any?

puts '######### none? ############'

print '1: '; puts %w[ant bear cat].none? { |word| word.length >= 3 }
print '2: '; puts %w[ant bear cat].none? { |word| word.length >= 4 }
print '3: '; puts %w[ant bear cat].none?(/t/)
print '4: '; puts [1, 2i, 3.14].none?(Numeric)
print '5: '; puts [1, 2i, 3.14].none?(String)
print '6: '; puts [nil, true, 99].none?
print '7: '; puts [].none?

puts '######### my_none? ############'

print '1: '; puts %w[ant bear cat].my_none? { |word| word.length >= 3 }
print '2: '; puts %w[ant bear cat].my_none? { |word| word.length >= 4 }
print '3: '; puts %w[ant bear cat].my_none?(/t/)
print '4: '; puts [1, 2i, 3.14].my_none?(Numeric)
print '5: '; puts [1, 2i, 3.14].my_none?(String)
print '6: '; puts [nil, true, 99].my_none?
print '7: '; puts [].my_none?

puts '######### count ############'

ary = [1, 2, 4, 2]
print '1: '; puts ary.inspect
print '2: '; puts ary.count
print '3: '; puts ary.count(2)
print '4: '; puts ary.count { |x| x%2==0 }

puts '######### my_count ############'

ary = [1, 2, 4, 2]
print '1: '; puts ary.inspect
print '2: '; puts ary.my_count
print '3: '; puts ary.my_count(2)
print '4: '; puts ary.my_count { |x| x%2==0 }

puts '######### inject ############'

print '1: '; puts (5..10).inject { |sum, n| sum + n }            
print '2: '; puts (5..10).inject(1) { |product, n| product * n }
# find the longest word
longest = %w{ cat sheep bear }.inject do |memo, word|
   memo.length > word.length ? memo : word
end
print '3: '; puts longest

puts '######### my_inject ############'

print '1: '; puts (5..10).my_inject { |sum, n| sum + n }            
print '2: '; puts (5..10).my_inject(1) { |product, n| product * n }
# find the longest word
longest = %w{ cat sheep bear }.inject do |memo, word|
  memo.length > word.length ? memo : word
end
print '3: '; puts longest

puts "################################"
# my_inject
p 'my_inject'
# # Sum some numbers
p (5..10).inject(:+) #=> 45
# # Same using a block and inject
p (5..10).inject { |sum, n| sum + n } #=> 45
# # Multiply some numbers
p (5..10).inject(1, :*) #=> 151200
# Same using a block
p (5..10).inject(1) { |product, n| product * n } #=> 151200

puts "################################"
puts "################################"
puts "################################"
a = [1, 5, 2 ,51]

a.each do |k|
  puts k
end

puts "################################"

a.my_each do |k|
  puts k
end