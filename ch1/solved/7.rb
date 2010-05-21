def caught_speeding(speed,birthday)
  if speed <= 60 || birthday && speed <= 65
    return 0
  elsif speed <= 80 || birthday && speed <= 85
    return 1
  else
    return 2
  end
end