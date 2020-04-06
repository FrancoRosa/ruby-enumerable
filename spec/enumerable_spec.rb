require_relative '../scripts.rb'

RSpec.describe Enumerable do
  describe "#my_each" do
    context "Iterate over a test sample" do
      it "loops trough an array" do
        input = [1, 2, 3, 4, 6, 7]
        r_each = []
        r_my_each = []
        input.my_each { |k| r_my_each << k + 22 }
        input.each { |k| r_each << k + 22 }
        actual = r_each
        expected = r_my_each
        expect(actual).to eql expected
      end
      it "loops trough a range" do
        input = (1..7)
        r_each = []
        r_my_each = []
        input.my_each { |k| r_my_each << k + 22 }
        input.each { |k| r_each << k + 22 }
        actual = r_each
        expected = r_my_each
        expect(actual).to eql expected
      end
      it "loops trough a range (without a block)" do
        input = (1..7)
        input = [1,2,3]
        actual = input.my_each
        expected = input.each
        expect(actual).to eql expected
      end
    end
  end

  describe "#my_each_with_index" do
    context "Iterate over a test sample" do
      it "loops trough an array and their indexes" do
        input = [1, 2, 3, 4, 6, 7]
        r_each = []
        r_my_each = []
        input.my_each { |k| r_my_each << k + 22 }
        input.each { |k| r_each << k + 22 }
        actual = r_each
        expected = r_my_each
        expect(actual).to eql expected
      end
      it "loops trough a range and their indexes" do
        input = (1..7)
        r_each = []
        r_my_each = []
        input.my_each { |k| r_my_each << k + 22 }
        input.each { |k| r_each << k + 22 }
        actual = r_each
        expected = r_my_each
        expect(actual).to eql expected
      end
      it "loops trough a range (without a block)" do
        input = (1..7)
        actual = input.my_each
        expected = input.each
        expect(actual).to eql expected
      end
    end
  end

  describe "#my_select" do
    context "Iterate over a test sample" do
      it "loops trough an array and compares with the argument" do
        input = [1, 2, 3, 4, 6, 7]
        actual = input.my_select(&:even?)
        expected = input.select(&:even?)
        expect(actual).to eql expected
      end
      it "loops trough an range uses a block as input" do
        input = [1, 5, 3, 4, 5, 7]
        actual = input.my_select { |x| x == 5 }
        expected = input.my_select { |x| x == 5 }
        expect(actual).to eql expected
      end
    end
  end

end
