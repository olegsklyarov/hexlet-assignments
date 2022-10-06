# frozen_string_literal: true

# rubocop:disable Style/For

def stop_word?(word, stop_words)
  for stop_word in stop_words
    return true if word == stop_word
  end
  false
end

def make_censored(text, stop_words)
  # BEGIN
  result = []
  for word in text.split
    result << (stop_word?(word, stop_words) ? '$#%!' : word)
  end
  result.join(' ')
  # END
end

# rubocop:enable Style/For
