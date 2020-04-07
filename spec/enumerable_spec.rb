require_relative '../scripts.rb'

RSpec.describe Enumerable do
  let(:test_array_1) { [11, 2, 3, 56] }
  let(:test_array_2) { %w[a b c d e] }
  let(:test_range_1) { (2..6) }
  describe '#my_each' do
    context 'when a block is given' do
      it 'concatenates the elements of the input' do
        expect { test_array_2.my_each { |k| print k } }.to output('abcde').to_stdout
      end
      it 'loops trough an array' do
        r_each = []
        r_my_each = []
        test_array_1.my_each { |k| r_my_each << k + 22 }
        test_array_1.each { |k| r_each << k + 22 }
        actual = r_each
        expected = r_my_each
        expect(actual).to eq expected
      end
      it 'loops trough a range' do
        r_each = []
        r_my_each = []
        test_range_1.my_each { |k| r_my_each << k + 22 }
        test_range_1.each { |k| r_each << k + 22 }
        actual = r_each
        expected = r_my_each
        expect(actual).to eq expected
      end
    end
    context 'when a block is not given' do
      it 'returns a Enumerator' do
        expect(test_range_1.my_each).to be_a(Enumerator)
        expect(test_range_1.my_each.to_a).to eq test_range_1.to_a
      end
    end
  end

  describe '#my_each_with_index' do
    context 'when a block is given' do
      it 'loops trough an array and their indexes' do
        input = [1, 2, 3, 4, 6, 7]
        r_each = []
        r_my_each = []
        input.my_each { |k| r_my_each << k + 22 }
        input.each { |k| r_each << k + 22 }
        actual = r_each
        expected = r_my_each
        expect(actual).to eq expected
      end
      it 'loops trough a range and their indexes' do
        input = (1..7)
        r_each = []
        r_my_each = []
        input.my_each { |k| r_my_each << k + 22 }
        input.each { |k| r_each << k + 22 }
        actual = r_each
        expected = r_my_each
        expect(actual).to eq expected
      end
    end
    context 'when a block is not given' do
      it 'returns a Enumerator' do
        expect(test_range_1.my_each).to be_a(Enumerator)
        expect(test_range_1.my_each.to_a).to eq test_range_1.to_a
      end
    end
  end

  describe '#my_select' do
    it 'returns array of elements that satisfies the block condition' do
      actual = test_array_1.my_select { |x| x == 5 }
      expected = test_array_1.select { |x| x == 5 }
      expect(actual).to eql expected
    end

    it 'returns a Enumerator when a block is not given' do
      expect(test_range_1.my_select).to be_a(Enumerator)
      expect(test_range_1.my_select.to_a).to eq test_range_1.to_a
    end
  end

  describe 'my_all?' do
    context 'when a block is given' do
      it 'returns false when an element does not satisfy the block condition' do
        expect(test_array_1.my_all? { |number| number < 56 }).to be false
      end
      it 'returns true when all elements satisfy the block condition' do
        expect(test_array_1.my_all? { |number| number <= 56 }).to be true
      end
    end

    context 'when an argument is given' do
      context 'when the argument is a RegExp' do
        it 'returns false when an element does not match the RegExp' do
          expect(%w[ant bear cat].my_all?(/t/)).to be false
        end
        it 'returns true when all elements match the RegExp' do
          expect(%w[ant goat cat].my_all?(/t/)).to be true
        end
      end
      context 'when the argument is a Class' do
        it 'returns false when an element does not belong the Class' do
          expect([1, '2', 'y', 'x'].my_all?(String)).to be false
        end
        it 'returns true when all elements belong the Class' do
          expect([1, 1.3, 2i, 4].my_all?(Numeric)).to be true
        end
      end
    end

    context 'when no argument or block is given' do
      it 'returns false when an element is a false class or nil' do
        expect([1, nil, 'y', 'x'].my_all?).to be false
        expect([1, false, 'y', 'x'].my_all?).to be false
      end
      it 'returns true when all elements are not false or nil' do
        expect([1, 1.3, 2i, 4].my_all?).to be true
      end
    end
  end

  describe 'my_any?' do
    context 'when a block is given' do
      it 'returns true when an element satisfies the block condition' do
        expect(test_array_1.my_any? { |number| number < 56 }).to be true
      end
      it 'returns false when no elements satisfy the block condition' do
        expect(test_array_1.my_any? { |number| number > 56 }).to be false
      end
    end

    context 'when an argument is given' do
      context 'when the argument is a RegExp' do
        it 'returns true when an element matches the RegExp' do
          expect(%w[ant bear cat].my_any?(/t/)).to be true
        end
        it 'returns false when no element matches the RegExp' do
          expect(%w[ant goat cat].my_any?(/h/)).to be false
        end
      end
      context 'when the argument is a Class' do
        it 'returns false when an element does not belong the Class' do
          expect([1, false, 3.1, nil].my_any?(String)).to be false
        end
        it 'returns true when all elements belong the Class' do
          expect([1, 'Ok', 2i, 4].my_any?(Numeric)).to be true
        end
      end
    end

    context 'when no argument or block is given' do
      it 'returns true when at least one element is false or nil' do
        expect([nil, nil, nil, 'x'].my_any?).to be true
        expect([1, false, 'y', 'x'].my_any?).to be true
      end
      it 'returns false when all elements are false or nil' do
        expect([false, nil, nil].my_any?).to be false
      end
    end
  end

  describe 'my_none?' do
    context 'when a block is given' do
      it 'returns false when an element satisfies the block condition' do
        expect(test_array_1.my_none? { |number| number < 56 }).to be false
      end
      it 'returns true when no elements satisfy the block condition' do
        expect(test_array_1.my_none? { |number| number > 56 }).to be true
      end
    end

    context 'when an argument is given' do
      context 'when the argument is a RegExp' do
        it 'returns false when an element matches the RegExp' do
          expect(%w[ant bear cat].my_none?(/t/)).to be false
        end
        it 'returns true when no element matches the RegExp' do
          expect(%w[ant goat cat].my_none?(/h/)).to be true
        end
      end
      context 'when the argument is a Class' do
        it 'returns false when an element belongs the Class' do
          expect([1, false, '3.1', nil].my_none?(String)).to be false
        end
        it 'returns true when none of the elements belong the Class' do
          expect([1, 25, 2i, 4].my_none?(String)).to be true
        end
      end
    end

    context 'when no argument or block is given' do
      it 'returns false when at least one element is false or nil' do
        expect([nil, nil, nil, 'x'].my_none?).to be false
        expect([1, false, 'y', 'x'].my_none?).to be false
      end
      it 'returns true when one of the elements are false or nil' do
        expect([false, nil, nil].my_none?).to be true
      end
    end
  end

  describe 'my_count' do
    it 'returns the number of elements equals to the argument' do
      expect([1, 2, 4, 2].my_count(2)).to eq 2
      expect([1, 2, 4, 2].my_count(9)).to eq 0
    end
    it 'returns the number of elements if no argument provided' do
      expect([1, 2, 4, 2].my_count).to eq 4
      expect([1, 2, 4, [2, 1]].my_count).to eq 4
    end
    it 'returns the number of elements that satisfies the block condition' do
      expect([1, 2, 4, 2].my_count { |k| (k % 2).zero? }).to eq 3
    end
  end

  describe 'my_map' do
    context 'when a block is given' do
      it 'returns an array, the block operations where applied to an array' do
        expect([1, 2, 7, 4, 5].my_map { |x| x * x }).to eq [1, 4, 49, 16, 25]
      end
      it 'returns an array, the block operations where applied to a range' do
        expect((1..4).my_map { |x| x * x }).to eq [1, 4, 9, 16]
      end
    end
    context 'when a proc is given' do
      my_proc = proc { |x| x * x }
      it 'returns an array, the proc operations where applied to an array' do
        expect([1, 2, 7, 4, 5].my_map(my_proc)).to eq [1, 4, 49, 16, 25]
      end
      it 'returns an array, the proc operations where applied to a range' do
        expect((1..4).my_map(my_proc)).to eq [1, 4, 9, 16]
      end
    end
  end

  describe 'my_inject' do
    context 'when a block is given' do
      it 'applies the operation to all elements' do
        expect((5..10).my_inject { |sum, n| sum + n }).to eq 45
        expect((5..10).my_inject { |sum, n| sum * n }).to eq 151_200
      end

      it 'applies the argument as initial value' do
        expect((5..10).my_inject(5) { |sum, n| sum + n }).to eq 50
        expect((5..10).my_inject(5) { |sum, n| sum * n }).to eq 756_000
      end
    end
    context 'when a symbol is given' do
      it 'applies the operator to all elements' do
        expect((5..10).my_inject(:+)).to eq 45
        expect((5..10).my_inject(:*)).to eq 151_200
      end
      it 'uses the numeric argument as initial value' do
        expect((5..10).my_inject(2, :+)).to eq 47
        expect((5..10).my_inject(2, :*)).to eq 302_400
      end
    end
    it 'can receive a proc as input' do
      search = proc { |memo, word| memo.length > word.length ? memo : word }
      expect(%w[hello strong am].my_inject(&search)).to eq 'strong'
    end
  end
end
