# rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

# Adidional methods for Enumerables
module Enumerable
  def my_each
    return to_enum unless block_given?
    data = self
    data = data.to_a if is_a?(Range)
    i = 0
    while i < size
      yield data[i]
      i += 1
    end
  end

  def my_each_with_index
    return to_enum unless block_given?
    i = 0
    while i < length
      yield self[i], i
      i = i.next
    end
  end

  def my_select
    return to_enum unless block_given?
    result = []
    my_each do |k|
      result << k if yield(k) == true
    end
    result
  end

  def my_all?(arg1 = nil)
    if arg1.nil?
      if block_given?
        my_each do |k|
          return false if yield(k) != true
        end
      else
        my_each do |k|
          return false if k != true
        end
      end
    elsif arg1.is_a?(Regexp)
      my_each do |k|
        return false if k !~ arg1
      end
    else
      my_each do |k|
        return false if k.is_a?(arg1) != true
      end
    end
    true
  end

  def my_any?(arg1 = nil)
    if arg1.nil?
      if block_given?
        my_each do |k|
          return true if yield(k) == true
        end
      else
        my_each do |k|
          return true if k == true
        end
      end
    elsif arg1.is_a?(Regexp)
      my_each do |k|
        return true if k =~ arg1
      end
    else
      my_each do |k|
        return true if k.is_a?(arg1) == true
      end
    end
    false
  end

  def my_none?(arg1 = nil)
    if arg1.nil?
      if block_given?
        my_each do |k|
          return false if yield(k) == true
        end
      else
        my_each do |k|
          return false if k == true
        end
      end
    elsif arg1.is_a?(Regexp)
      my_each do |k|
        return false if k =~ arg1
      end
    else
      my_each do |k|
        return false if k.is_a?(arg1) == true
      end
    end
    true
  end

  def my_count(*arg1)
    count = 0
    if arg1.nil?
      if block_given?
        my_each do |k|
          count += 1 if yield(k) == true
        end
      else
        count = length
      end
    else
      my_each do |k|
        count += 1 if k == arg1
      end
    end
    count
  end

  def my_map(*args)
    result = []
    if args[0].is_a?(Proc)
      my_each do |k|
        result << args[0].call(k)
      end
      return result
    end
    return to_enum unless block_given?
    my_each do |k|
      result << yield(k)
    end
    result
  end

  def my_inject(*args)
    mem = 0
    if args[0].is_a?(Numeric)
      mem = args[0]
      if !args[1]
        my_each do |k|
          mem = yield(mem, k)
        end
      else
        my_each do |k|
          mem = mem.send(args[1], k)
        end
      end
    elsif args[0].is_a?(Symbol)
      my_each do |k|
        mem = mem.send(args[0], k)
      end
    elsif args[0].nil?
      my_each do |k|
        mem = yield(mem, k)
      end
    end
    mem
  end
end

def multiply_els(arg)
  arg.inject(:*)
end
