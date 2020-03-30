# Adidional methods for Enumerables
module Enumerable

  def my_each
    if block_given?
      i = 0
      while i < length
        yield self[i]
        i = i.next
      end
    else
      to_enum
    end
  end

  def my_each_with_index
    if block_given?
      i = 0
      while i < length
        yield self[i], i
        i = i.next
      end
    else
      to_enum
    end
  end

  def my_select
    if block_given?
      result = []
      each do |k|
        result << k if yield(k) == true
      end
      result
    else
      to_enum
    end
  end

  # def my_map(&block)
  #   result = []
  #   my_each do |k|
  #     if k == block.call(k)
  #       result << k
  #     end
  #   end
  #   result
  # end
end

a = [2,756,34,68,1]
puts "#### Embeded: ####"
puts a.select {|k| k.even?}
puts "#### Mine: ####"
puts a.my_select {|k| k.even?}

puts "#### Embeded: ####"
puts a.select
puts "#### Mine: ####"
puts a.my_select