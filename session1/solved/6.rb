def odds_and_evens(string, return_odds)
  to_return = ""
  string.size.times do |index|
    if (return_odds && index.odd?) || (!return_odds && index.even?)
      to_return << string[index]
    end
  end
  to_return
end
