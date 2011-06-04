def list_size(list)
  size = 0
  size += 1 while list = list[:next]
  size + 1
end


def middle(list)
  middle = list_size(list) / 2
  middle.times { list = list[:next] }
  list[:data]
end

