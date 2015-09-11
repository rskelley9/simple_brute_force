word_list = open("test_list.txt").each_line.flat_map do |line|
  line.downcase.split(/[^[:alpha:]]/).reject(&:empty?)
end.uniq.sort

p word_list