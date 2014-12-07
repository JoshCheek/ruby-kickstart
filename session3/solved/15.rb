def list_size(list)
  return 0 unless list
  1 + list_size(list[:next])
end

def middle(list, distance=list_size(list)/2)
  return list[:data] if distance == 0
  middle list[:next], (distance - 1)
end
