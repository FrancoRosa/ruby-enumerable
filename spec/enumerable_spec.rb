require_relative '../scripts.rb'

RSpec.describe Enumerable do
  let(:test_array_1) { [11, 2, 3, 56] }
  let(:test_array_2) { %w[a b c d e] }
  let(:test_range_1) { (2..6) }
  describe '#my_each' do
    context 'when a block is given' do
      it 'concatenates the elements of the input' do
        expect {test_array_2.my_each { |k| print k }}.to output('abcde').to_stdout
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
    context "when a block is not given" do
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
end
