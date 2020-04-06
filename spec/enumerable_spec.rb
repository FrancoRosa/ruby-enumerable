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
    context 'Iterate over a test sample' do
      it 'loops trough an array and compares with the argument' do
        input = [1, 2, 3, 4, 6, 7]
        actual = input.my_select(&:even?)
        expected = input.select(&:even?)
        expect(actual).to eql expected
      end
      it 'loops trough an range uses a block as input' do
        input = [1, 5, 3, 4, 5, 7]
        actual = input.my_select { |x| x == 5 }
        expected = input.select { |x| x == 5 }
        expect(actual).to eql expected
      end
      it 'returns an Enumerator (without a block)' do
        input = [1, 5, 3, 4, 5, 7]
        actual = input.my_select
        expect(actual.class).to eq Enumerator
      end
    end
  end
end
