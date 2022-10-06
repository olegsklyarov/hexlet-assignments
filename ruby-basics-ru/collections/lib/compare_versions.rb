# frozen_string_literal: true

# rubocop:disable Style/For
# BEGIN
def compare_versions(ver1, ver2)
  a1 = ver1.split('.')
  a2 = ver2.split('.')
  for i in 0...[a1.size, a2.size].min
    diff = a1[i].to_i <=> a2[i].to_i
    return diff unless diff.zero?
  end
  a1.size <=> a2.size
end
# END
# rubocop:enable Style/For
