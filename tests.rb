require './scripts.rb'

puts '######### all? ############'

print '1: '; puts %w[ant bear cat].all? { |word| word.length >= 3 }
print '2: '; puts %w[ant bear cat].all? { |word| word.length >= 4 }
print '3: '; puts %w[ant bear cat].all?(/t/)
print '4: '; puts [1, 2i, 3.14].all?(Numeric)
print '5: '; puts [1, 2i, 3.14].all?(String)
print '6: '; puts [nil, true, 99].all?
print '7: '; puts [].all?
p [1, true, 'hi', []].all?
p [3, 3, 3, 3].all?(3)

puts '######### my_all? ############'

print '1: '; puts %w[ant bear cat].my_all? { |word| word.length >= 3 }
print '2: '; puts %w[ant bear cat].my_all? { |word| word.length >= 4 }
print '3: '; puts %w[ant bear cat].my_all?(/t/)
print '4: '; puts [1, 2i, 3.14].my_all?(Numeric)
print '5: '; puts [1, 2i, 3.14].my_all?(String)
print '6: '; puts [nil, true, 99].my_all?
print '7: '; puts [].my_all?
p [1, true, 'hi', []].my_all?
p [3, 3, 3, 3].my_all?(3)

puts '######### any? ############'

print '1: '; puts %w[ant bear cat].any? { |word| word.length >= 3 }
print '2: '; puts %w[ant bear cat].any? { |word| word.length >= 4 }
print '3: '; puts %w[ant bear cat].any?(/t/)
print '4: '; puts [1, 2i, 3.14].any?(Numeric)
print '5: '; puts [1, 2i, 3.14].any?(String)
print '6: '; puts [nil, true, 99].any?
print '7: '; puts [].any?
p ['cat', 2, 32].any?('cap')

puts '######### my_any? ############'

print '1: '; puts %w[ant bear cat].my_any? { |word| word.length >= 3 }
print '2: '; puts %w[ant bear cat].my_any? { |word| word.length >= 4 }
print '3: '; puts %w[ant bear cat].my_any?(/t/)
print '4: '; puts [1, 2i, 3.14].my_any?(Numeric)
print '5: '; puts [1, 2i, 3.14].my_any?(String)
print '6: '; puts [nil, true, 99].my_any?
print '7: '; puts [].my_any?
p ['cat', 2, 32].my_any?('cap')

puts '######### none? ############'

print '1: '; puts %w[ant bear cat].none? { |word| word.length >= 3 }
print '2: '; puts %w[ant bear cat].none? { |word| word.length >= 4 }
print '3: '; puts %w[ant bear cat].none?(/t/)
print '4: '; puts [1, 2i, 3.14].none?(Numeric)
print '5: '; puts [1, 2i, 3.14].none?(String)
print '6: '; puts [nil, true, 99].none?
print '7: '; puts [].none?
p ['hello'].none?(5)

puts '######### my_none? ############'

print '1: '; puts %w[ant bear cat].my_none? { |word| word.length >= 3 }
print '2: '; puts %w[ant bear cat].my_none? { |word| word.length >= 4 }
print '3: '; puts %w[ant bear cat].my_none?(/t/)
print '4: '; puts [1, 2i, 3.14].my_none?(Numeric)
print '5: '; puts [1, 2i, 3.14].my_none?(String)
print '6: '; puts [nil, true, 99].my_none?
print '7: '; puts [].my_none?
p ['hello'].my_none?(5)

puts '######### count ############'

ary = [1, 2, 4, 2]
print '1: '; puts ary.inspect
print '2: '; puts ary.count
print '3: '; puts ary.count(2)
print '4: '; puts ary.count { |x| x%2==0 }
print '5: '; puts [8,87,6,5].count
print '6: '; puts [1, 2, 3].count(2)
block = proc { |num| num < (2 + 24) / 2 }
print '7: '; puts [23,13,12,43].count(&block)

puts '######### my_count ############'

ary = [1, 2, 4, 2]
print '1: '; puts ary.inspect
print '2: '; puts ary.my_count
print '3: '; puts ary.my_count(2)
print '4: '; puts ary.my_count { |x| x%2==0 }
print '5: '; puts [8,87,6,5].my_count
print '6: '; puts [1, 2, 3].my_count(2)
block = proc { |num| num < (2 + 24) / 2 }
print '7: '; puts [23,13,12,43].my_count(&block)

puts '######### inject ############'

print '1: '; puts (1..10).inject(:+)
print '2: '; puts (1..10).inject { |sum, n| sum * n }
print '3: '; puts (1..10).inject(1, :*)
print '4: '; puts (1..10).inject(1) { |product, n| product * n }
search = proc { |memo, word| memo.length > word.length ? memo : word }
print '5: '; puts ["Cool", "sat", "rataman"].inject(&search)

puts '######### my_inject ############'

print '1: '; puts (1..10).my_inject(:+)
print '2: '; puts (1..10).my_inject { |sum, n| sum * n }
print '3: '; puts (1..10).my_inject(1, :*)
print '4: '; puts (1..10).my_inject(1) { |product, n| product * n }
search = proc { |memo, word| memo.length > word.length ? memo : word }
print '5: '; puts ["Cool", "sat", "rataman"].my_inject(&search)

puts '######### multiply_els ############'

print '1: '; puts multiply_els([2, 4, 5])

puts '######### my_map_proc ############'

print '1: '; puts [2, 4, 5].my_map{ |k| k + 99 }.inspect
my_proc = proc { |s| s + 99 }
print '2: '; puts [2, 4, 5].my_map(my_proc).inspect
