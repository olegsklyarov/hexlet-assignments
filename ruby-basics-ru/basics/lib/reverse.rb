# frozen_string_literal: true

# BEGIN
def reverse(str)
  reversed = ''
  i = str.length - 1
  while i >= 0
    reversed += str[i]
    i -= 1
  end
  reversed
end
# END
