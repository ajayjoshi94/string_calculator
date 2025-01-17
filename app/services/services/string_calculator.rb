module Services
  class StringCalculator
    def add(numbers)
      return 0 if numbers.empty?

      delimiter, numbers = parse_input(numbers)
      numbers_array = numbers.split(Regexp.new(delimiter)).map(&:to_i)
      negative_numbers = numbers_array.select(&:negative?)

      if negative_numbers.any?
        error_message = "Negative numbers not allowed: #{negative_numbers.join(', ')}"
        puts error_message  # This will print the message to the terminal
        raise error_message  # This raises the error with the message
      end

      numbers_array.sum
    end

    private

    def parse_input(input)
      if input.start_with?("//")
        custom_delimiter, numbers = input[2..].split("\n", 2)
        return [Regexp.escape(custom_delimiter), numbers]
      end

      [",|\n", input]
    end
  end
end