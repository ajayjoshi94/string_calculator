require 'rails_helper'

RSpec.describe StringCalculator do
  describe '#add' do
    let(:calculator) { Services::StringCalculator.new }

    it 'returns 0 for an empty string' do
      result = calculator.add('')
      puts "0. Test Case: Empty String => Result: #{result}"
      expect(result).to eq(0)
    end

    it 'returns the sum of two comma-separated numbers' do
      result = calculator.add('1,5')
      puts "1. Test Case: Sum of Two Numbers => Result: #{result}"
      expect(result).to eq(6)
    end

    it 'handles an arbitrary number of numbers' do
      result = calculator.add('1,2,3,4,5')
      puts "2. Test Case: Sum of Multiple Numbers => Result: #{result}"
      expect(result).to eq(15)
    end

    it 'handles newlines between numbers' do
      result = calculator.add("1\n2,3")
      puts "3. Test Case: Newline Between Numbers => Result: #{result}"
      expect(result).to eq(6)
    end

    it 'supports custom delimiters' do
      result = calculator.add("//;\n1;2")
      puts "4. Test Case: Custom Delimiter => Result: #{result}"
      expect(result).to eq(3)
    end

    it 'raises an exception for negative numbers' do
      negative_input = '1,-2,-3'
      expect { calculator.add(negative_input) }
        .to raise_error("Negative numbers not allowed: -2, -3")
    end
  end
end