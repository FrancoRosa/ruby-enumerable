# Adidional methods for Enumerables
module Enumerable

  def my_each
    if block_given?
      i = 0
      while i < length
        yield self[i]
        i = i.next
      end
    end
    to_enum
  end

  def my_each_with_index
    if block_given?
      i = 0
      while i < length
        yield self[i], i
        i = i.next
      end
    end
    to_enum
  end

  # def my_select &block 
  #   result = []
  #   my_each do |element|
  #     result << element if element == block.call(element)
  #   end
  #   result
  # end

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