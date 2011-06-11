def list_size(list)
  size = 1
  size += 1 while list = list[:next]
  size
end

def middle(list)
  middle = list_size(list) / 2
  middle.times { list = list[:next] }
  list[:data]
end
