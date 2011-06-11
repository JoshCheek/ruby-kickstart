def print_list_in_reverse(list)
  return unless list
  print_list_in_reverse list[:next]
  puts list[:data]
end
