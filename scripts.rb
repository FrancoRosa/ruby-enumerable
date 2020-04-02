# rubocop:disable Metrics/BlockNesting
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/ModuleLength
# rubocop:disable Style/IfInsideElse
# rubocop:disable Style/CaseEquality

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
    my_each { |k| result << k if yield(k) == true }
    result
  end

  def my_all?(arg1 = nil)
    if arg1.nil?
      if block_given?
        my_each { |k| return false if yield(k) != true }
      else
        my_each { |k| return false if (k == nil && k != true  )  }
      end
    elsif arg1.is_a?(Regexp)
      my_each { |k| return false if k !~ arg1 }
    elsif arg1.is_a?(Class)
      my_each { |k| return false if k.is_a?(arg1) != true }
    else
      my_each { |k| return false if k != arg1 }
    end
    true
  end

  def my_any?(arg1 = nil)
    if arg1.nil?
      if block_given?
        my_each { |k| return true if yield(k) == true }
      else
        my_each { |k| return true if k == true }
      end
    elsif arg1.is_a?(Regexp)
      my_each { |k| return true if k =~ arg1 }
    elsif arg1.is_a?(Class)
      my_each { |k| return true if k.is_a?(arg1) == true }
    else
      my_each { |k| return true if k == arg1 }
    end
    false
  end

  def my_none?(arg1 = nil)
    if arg1.nil?
      if block_given?
        my_each { |k| return false if yield(k) == true }
      else
        my_each { |k| return false if k == true }
      end
    elsif arg1.is_a?(Regexp)
      my_each { |k| return false if k =~ arg1 }
    elsif arg1.is_a?(Class)
      my_each { |k| return false if k.is_a?(arg1) == true }
    else
      my_each { |k| return false if k == arg1 }
    end
    true
  end

  def my_count(arg1 = nil)
    count = 0
    if arg1.nil?
      if block_given?
        my_each { |k| count += 1 if yield(k) == true }
      else
        count = length
      end
    else
      my_each { |k| count += 1 if k == arg1 }
    end
    count
  end

  def my_map(*args)
    mem = []
    if args[0].is_a?(Proc)
      my_each { |k| mem << args[0].call(k) }
      return mem
    end
    return to_enum unless block_given?

    my_each { |k| mem << yield(k) }
    mem
  end

  def my_inject(*args)
    mem = to_a.shift
    if args[0].is_a?(Numeric)
      mem = args[0]
      if !args[1]
        my_each { |k| mem = yield(mem, k) }
      else
        my_each { |k| mem = mem.send(args[1], k) }
      end
    elsif args[0].is_a?(Symbol)
      my_each { |k| mem = mem.send(args[0], k) }
    elsif args[0].nil?
      my_each { |k| mem = yield(mem, k) }
    end
    mem
  end
end

def multiply_els(arg)
  arg.inject(:*)
end

# rubocop:enable Metrics/BlockNesting
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/ModuleLength
# rubocop:enable Style/IfInsideElse
# rubocop:enable Style/CaseEquality