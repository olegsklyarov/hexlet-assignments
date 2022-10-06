# frozen_string_literal: true

# BEGIN
def count_by_years(users)
  men = users.select { |user| user[:gender] == 'male' }
  years = men.map { |man| man[:birthday].split('-').first }
  years.tally
end
# END
