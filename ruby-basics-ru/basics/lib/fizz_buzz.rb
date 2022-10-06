# frozen_string_literal: true

# BEGIN
def describe_number(number)
  return 'FizzBuzz' if (number % 15).zero?
  return 'Fizz' if (number % 3).zero?
  return 'Buzz' if (number % 5).zero?

  number.to_s
end

def fizz_buzz(start, stop)
  return nil if start > stop

  result = []
  i = start
  while i <= stop
    result.push(describe_number(i))
    i += 1
  end
  result.join(' ')
end
# END
