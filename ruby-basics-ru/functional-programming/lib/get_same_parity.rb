# frozen_string_literal: true

# BEGIN
def get_same_parity(numbers)
  return [] if numbers.empty?

  is_even_first_number = numbers.first.even?
  numbers.select { |number| number.even? == is_even_first_number }
end
# END
