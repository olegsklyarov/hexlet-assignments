# frozen_string_literal: true

# BEGIN
def fibonacci(number)
  return nil if number.negative?

  fib = 0
  fib_succ = 1
  i = 0
  while i < number
    fib_succ = fib + fib_succ
    fib = fib_succ - fib
    i += 1
  end
  fib
end
# END
