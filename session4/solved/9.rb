def full_name(person)
  begin
    "#{person.first_name} #{person.last_name}"
  rescue FirstNameError
    person.last_name
  rescue LastNameError
    person.first_name
  end
end
