def list_of_errors_and_exceptions
  Module.constants.grep(/exception|error/i)
end