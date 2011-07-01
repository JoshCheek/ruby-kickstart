module CaesarCipher
  
  # Hash where you give it a character and it returns the
  # encrypted or decrypted value (will be built up below)
  ENCRYPT_MAP = Hash.new { |hash, key| key }
  DECRYPT_MAP = Hash.new { |hash, key| key }
  
  # will find first index, so first 'a', but 3 chars after first 'x', will be another 'a'
  lowercase     =  ('a'..'z').to_a + ['a', 'b', 'c']
  uppercase     =  ('A'..'Z').to_a + ['A', 'B', 'C']
  numerical     =  ('0'..'9').to_a + ['0', '1', '2']
  
  # now, for each group, map the appropriate characters
  [lowercase, uppercase, numerical].each do |character_set|
    character_set.each_cons 4 do |char, _, __, char_plus_three|
      ENCRYPT_MAP[char] = char_plus_three
      DECRYPT_MAP[char_plus_three] = char
    end
  end
  
  def self.encrypt(message)
    new_message = ''
    message.each_char { |crnt_char| new_message << ENCRYPT_MAP[crnt_char] }
    new_message
  end
  
  def self.decrypt(message)
    original_message = ''
    message.each_char { |crnt_char| original_message << DECRYPT_MAP[crnt_char] }
    original_message
  end
  
end
