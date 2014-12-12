errors = Module.constants.grep(/error|exception/i)

RSpec.describe 'list_of_errors_and_exceptions' do
  %w(
    Lowercaseerror
    Lowercaseexception
    Errorerr
    Exceptionatstart
    ExceptionAtStart
    ExcEPtion
    Abcexceptiondef
  ).each do |error_to_find|
    # changed between 1.8 and 1.9
    if Module.constants.first.kind_of? Symbol
      error_to_find = error_to_find.to_sym
    end

    Object.const_set error_to_find, Class.new(StandardError)

    example "finds the added #{error_to_find}" do
      expect(list_of_errors_and_exceptions).to include error_to_find
    end
  end
end
