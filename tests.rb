require './scripts.rb'

test_array1 = [11, 2, 3, 56]
test_array2 = %w[a b c d]

=begin
# my_each
p 'my_each'
test_array1.my_each { |x| p x }
test_array2.my_each { |x| p x }
p test_array2.my_each

array = [1, 2, 3, 5, 1, 7, 3, 4, 5, 7, 2, 3, 2, 0, 8, 8, 7, 8, 1, 6, 1, 1, 7, 2, 1, 2, 5, 8, 6, 0, 4, 5, 8, 2, 2, 5, 4, 7, 3, 4, 3, 3, 8, 5, 1, 0, 3, 7, 5, 5, 7, 2, 6, 7, 7, 0, 4, 4, 0, 2, 0, 6, 6, 8, 1, 6, 8, 6, 2, 3, 6, 1, 5, 2, 6, 7, 2, 5, 8, 2, 0, 7, 3, 2, 3, 6, 1, 2, 8, 3, 7, 0, 5, 0, 0, 2, 6, 1, 5, 2] 
my_each_output = ''
block = proc { |num| my_each_output += num.to_s }
array.my_each(&block)
p my_each_output # => "1235173457232088781611721258604582254734338510375572677044020668168623615267258207323612837050026152"
# my_each_with_index
p 'my_each_with_index'
test_array1.my_each_with_index { |x, y| p "item: #{x}, index: #{y}" }
#test_array2.my_each_with_index(2) { |x, y| p "item: #{x}, index: #{y}" }
p test_array2.my_each_with_index

=end
# my_select
p 'my_select'
p test_array1.my_select(&:even?)
p test_array2.my_select { |x| x == 'c' }
p test_array2.my_select
=begin

# my_all?
p 'my_all?'
p %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
p %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
p %w[ant bear cat].my_all?(/t/) #=> false
p [1, 2i, 3.14].my_all?(Numeric) #=> true
p [nil, true, 99].my_all? #=> false 
p [].my_all? #=> true
p [].my_all? # true
p [1, 2].my_all?(Numeric) # true
p [1, 2].my_all?(String) # false
p [1, 2].my_all?(1) # false
p [1, 1].my_all?(1) # true
p "======================="

# my_any?
p 'my_any?'
p %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
p %w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
p %w[ant bear cat].my_any?(/d/) #=> false
p [nil, true, 99].my_any?(Integer) #=> true
p [nil, true, 99].my_any? #=> true
p [].my_any? #=> false
p [1, 2, 3, 's'].my_any?(String) #=> true
p [1, 2, 3, 's'].my_any?(Numeric) #=> true
p [1, 2, 3].my_any?(String) #=> false
p [1, 2].my_any?(1) # true
p [1, 1].my_any?(1) # true

# my_none?
p 'my_none?'
p %w[ant bear cat].my_none?(/d/) #=> true
p %w[ant bear cat].my_none? { |word| word.length == 5 } #=> true
p %w[ant bear cat].my_none? { |word| word.length >= 4 } #=> false
p [1, 3.14, 42].my_none?(Float) #=> false
p [].my_none? #=> true
p [nil].my_none? #=> true
p [nil, false].my_none? #=> true
p [nil, false, true].my_none? #=> false
p [1, 2, 3].my_none?(1) #=> false
p [1, 2, 3].my_none?(4) #=> true
p [nil, false, nil, false].my_none? #true

# my_count
p 'my_count'
ary = [1, 2, 4, 2]
p ary.my_count #=> 4
p ary.my_count(9) #=> 0
p ary.my_count(2) #=> 2
p ary.my_count(&:even?) #=> 3
p ary.count(&:even?) #=> 3 (my own improvement)

# # my_map
p 'my_map'
arr = [1, 2, 7, 4, 5]
p arr.my_map { |x| x * x }
p (1..2).my_map { |x| x * x }
myMapP = proc { |x| x * x }
p arr.my_map(myMapP)
p arr.my_map

# my_inject
p 'my_inject'
# # Sum some numbers
p (5..10).my_inject(:+) #=> 45
# # Same using a block and inject
p (5..10).my_inject { |sum, n| sum + n } #=> 45
# # Multiply some numbers
p (5..10).my_inject(1, :*) #=> 151200
# Same using a block
p (5..10).my_inject(1) { |product, n| product * n } #=> 151200

search = proc { |memo, word| memo.length > word.length ? memo : word }
p ['hello','strong','am'].my_inject(&search) # => "strong"
=end