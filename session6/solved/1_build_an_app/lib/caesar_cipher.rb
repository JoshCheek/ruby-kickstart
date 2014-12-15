module CaesarCipher

  # Hash where you give it a character and it returns the
  # encrypted or decrypted value (will be built up below)
  ENCRYPT_MAP = Hash.new { |hash, key| key }
  DECRYPT_MAP = Hash.new { |hash, key| key }

  lowercase = ('a'..'z').to_a
  uppercase = ('A'..'Z').to_a
  numerical = ('0'..'9').to_a

  # now, for each group, map the appropriate characters
  [lowercase, uppercase, numerical].each do |chars|
    ENCRYPT_MAP.merge! Hash[chars.zip(chars.rotate  3)]
    DECRYPT_MAP.merge! Hash[chars.zip(chars.rotate -3)]
  end

  def self.encrypt(message)
    message.gsub /./, ENCRYPT_MAP
  end

  def self.decrypt(message)
    message.gsub /./, DECRYPT_MAP
  end
end
