# frozen_string_literal: true

# BEGIN
def anagramm_filter(etalon, words)
  sorted_etalon_chars = etalon.chars.sort
  words.select { |word| word.chars.sort == sorted_etalon_chars }
end
# END
