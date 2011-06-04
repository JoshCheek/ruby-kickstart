def print_list(list)
  while list
    puts list[:data]
    list = list[:next]
  end
end
