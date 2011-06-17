def list_of_errors_and_exceptions
  Object.constants.grep(/exception|error/i)
end